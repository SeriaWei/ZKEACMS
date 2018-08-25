using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.ObjectPool;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;

namespace Easy
{
    //这个类支持实现这样一种“池”机制：
    //当外部要获取一个资源时，首先尝试从“池”中获取，但如果从“池”创建的资源总数已经达到了一个限定值，
    //则会按普通方式获取。
    //池中对象是通过一个Scoped的ServiceProvider创建的，所以暂时不会被Dispose（因为那个Scope要到最后才Dispose），
    //……
    //曾经用这个类帮助实现了一个DbContext池（不同于EF提供的DbContextPool）。
    //还可以稍作改进（去掉泛型类里面的IServiceGetter）……

    public class ResourcePool
    {
        /// <summary>
        /// 提供ServiceProvider
        /// </summary>
        public interface IServiceProviderProvider
        {
            IServiceProvider Provider { get; }
        }
    }
    /// <summary>
    /// 针对某个类型为T的资源的池
    /// </summary>
    /// <typeparam name="T">资源类型</typeparam>
    public class ResourcePool<T> : ResourcePool, IDisposable where T : class
    {
        public interface IServiceGetter
        {
            T Get(IServiceProvider serviceProvider);
        }
        public class Options
        {
            public Options() { MaximumRetained = Environment.ProcessorCount * 2; }
            public int MaximumRetained { get; set; }
        }
        public class ServiceGetter<TImplemention> : IServiceGetter where TImplemention : T
        {
            public T Get(IServiceProvider serviceProvider)
            {
                return serviceProvider.GetService<TImplemention>();
            }
        }
        public interface ITransientResourceHolder : System.IDisposable
        {
            T Resource { get; }
        }
        class PooledObjectPolicy : PooledObjectPolicy<T>
        {
            public PooledObjectPolicy(IServiceScope serviceScope, int maximumRetained,
                IServiceGetter serviceGetter)
            {
                _serviceScope = serviceScope;
                _maximumRetained = maximumRetained;
                _serviceGetter = serviceGetter;
            }
            readonly IServiceScope _serviceScope;
            readonly int _maximumRetained;
            readonly IServiceGetter _serviceGetter;
            int _numObjectsInPool;
            public override T Create()
            {
                if (System.Threading.Interlocked.Increment(ref _numObjectsInPool) > _maximumRetained)
                {
                    System.Threading.Interlocked.Decrement(ref _numObjectsInPool);
                    return null;
                }
                var dbContext = _serviceGetter.Get(_serviceScope.ServiceProvider);
                return dbContext;
            }
            public override bool Return(T obj)
            {
                return true;
            }
        }
        public class TransientResourceHolder : ITransientResourceHolder
        {
            public TransientResourceHolder(ResourcePool<T> pool)
            {
                _pool = pool;
                _resource = _pool._inner?.Get();
                if (_resource != null)
                {
                    _resourceShouldReturnToPool = true;
                }
                else
                {
                    _resourceShouldReturnToPool = false;
                    _resource = _pool._serviceGetter.Get(_pool._serviceProviderProvider.Provider);
                }
            }
            public void Dispose()
            {
                if (_resourceShouldReturnToPool)
                    _pool._inner.Return(_resource);
            }
            public T Resource { get { return _resource; } }
            readonly ResourcePool<T> _pool;
            readonly T _resource;
            readonly bool _resourceShouldReturnToPool;
        }
        public ResourcePool(IServiceProviderProvider serviceProviderProvider, Options options,
            IServiceGetter serviceGetter)
        {
            _serviceProviderProvider = serviceProviderProvider;
            _serviceGetter = serviceGetter;
            int maximumRetained = Math.Max(options.MaximumRetained, 0);
            if (maximumRetained > 0)
            {
                _serviceScope = _serviceProviderProvider.Provider.CreateScope();
                _pooledObjectPolicy = new PooledObjectPolicy(_serviceScope, maximumRetained, _serviceGetter);
                _inner = new DefaultObjectPool<T>(_pooledObjectPolicy, maximumRetained);
            }
        }
        public void Dispose()
        {
            if (_serviceScope != null)
                _serviceScope.Dispose();
        }
        readonly IServiceProviderProvider _serviceProviderProvider;
        readonly IServiceGetter _serviceGetter;
        readonly IServiceScope _serviceScope;
        readonly PooledObjectPolicy _pooledObjectPolicy;
        readonly ObjectPool<T> _inner;
    }
}
