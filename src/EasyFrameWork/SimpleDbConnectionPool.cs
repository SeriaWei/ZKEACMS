using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using Microsoft.Extensions.ObjectPool;

namespace Easy
{
    /// <summary>
    /// 仅仅对单独一个数据库提供的连接池，对多个数据库的情形不支持
    /// </summary>
    public class SimpleDbConnectionPool : IDisposable
    {
        public class Options
        {
            public Options() { MaximumRetained = Environment.ProcessorCount * 2; }
            public int MaximumRetained { get; set; }
        }
        class PooledObjectPolicy : PooledObjectPolicy<DbConnection>
        {
            internal PooledObjectPolicy(int maximumRetained, Func<DbConnection> funcCreateConnection)
            {
                _maximumRetained = maximumRetained;
                _createdObjects = new DbConnection[_maximumRetained];
                _funcCreateConnection = funcCreateConnection;
            }
            internal readonly DbConnection[] _createdObjects;
            readonly int _maximumRetained;
            readonly Func<DbConnection> _funcCreateConnection;
            int _numObjectsInPool;

            public override DbConnection Create()
            {
                var cnt = System.Threading.Interlocked.Increment(ref _numObjectsInPool);
                if (cnt > _maximumRetained)
                {
                    System.Threading.Interlocked.Decrement(ref _numObjectsInPool);
                    return null;
                }
                var dbConnection = _funcCreateConnection();
                _createdObjects[cnt - 1] = dbConnection;
                return dbConnection;
            }
            public override bool Return(DbConnection obj)
            {
                return true;
            }
        }
        public class TransientObjectHolder : IDisposable
        {
            public TransientObjectHolder(SimpleDbConnectionPool pool)
            {
                _pool = pool;
                _object = _pool._inner?.Get();
                if (_object != null)
                {
                    _objectShouldReturnToPool = true;
                }
                else
                {
                    _object = _pool._funcCreateConnection();
                    _objectShouldReturnToPool = false;
                }
                if (_object != null && _object.State == System.Data.ConnectionState.Closed)
                {//预先打开数据库，为的是确保在使用EF的场合（比如ASP.Net）不会频繁打开/关闭数据库而致使性能下降
                    _object.Open();
                }
            }
            public void Dispose()
            {
                if (_object != null)
                {
                    if (_objectShouldReturnToPool)
                        _pool._inner.Return(_object);
                    else
                        _object.Dispose();
                    _object = null;
                }
            }
            public DbConnection Object { get { return _object; } }
            readonly SimpleDbConnectionPool _pool;
            DbConnection _object;
            readonly bool _objectShouldReturnToPool;
        }
        public SimpleDbConnectionPool(Options options, Func<DbConnection> funcCreateConnection)
        {
            _funcCreateConnection = funcCreateConnection;
            int maximumRetained = Math.Max(options.MaximumRetained, 0);
            if (maximumRetained > 0)
            {
                _pooledObjectPolicy = new PooledObjectPolicy(maximumRetained, _funcCreateConnection);
                _inner = new DefaultObjectPool<DbConnection>(_pooledObjectPolicy, maximumRetained);
            }
        }
        public void Dispose()
        {
            if (_pooledObjectPolicy != null)
            {
                var objects = _pooledObjectPolicy._createdObjects;
                for (int i = 0; i < objects.Length; ++i)
                {
                    if (objects[i] != null)
                    {
                        objects[i].Dispose();
                        objects[i] = null;
                    }
                }
            }
        }
        readonly Func<DbConnection> _funcCreateConnection;
        readonly PooledObjectPolicy _pooledObjectPolicy;
        readonly ObjectPool<DbConnection> _inner;
    }
}
