using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;

namespace Easy
{
    public static class ServiceLocator
    {
        public static IServiceProvider Current { get; set; }
        public static T GetService<T>()
        {
            return Current.GetService<T>();
        }
        public static IEnumerable<T> GetServices<T>()
        {
            return Current.GetServices<T>();
        }
        public static object GetService(Type type)
        {
            return Current.GetService(type);
        }
        public static IEnumerable<object> GetServices(Type type)
        {
            return Current.GetServices(type);
        }
    }
}