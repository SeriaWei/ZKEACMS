using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;

namespace Easy
{
    public class ServiceLocator
    {
        public IServiceProvider Current { get; } = Builder.ServiceCollection.BuildServiceProvider();
        public T GetService<T>()
        {
            return Current.GetService<T>();
        }
        public IEnumerable<T> GetServices<T>()
        {
            return Current.GetServices<T>();
        }
        public object GetService(Type type)
        {
            return Current.GetService(type);
        }
        public IEnumerable<object> GetServices(Type type)
        {
            return Current.GetServices(type);
        }
    }
}