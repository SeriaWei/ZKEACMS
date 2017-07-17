using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;

namespace Easy
{
    public static class ServiceLocator
    {
        public static IHttpContextAccessor HttpContextAccessor;
        public static T GetService<T>()
        {
            return HttpContextAccessor.HttpContext.RequestServices.GetService<T>();
        }
        public static IEnumerable<T> GetServices<T>()
        {
            return HttpContextAccessor.HttpContext.RequestServices.GetServices<T>();
        }
        public static object GetService(Type type)
        {
            return HttpContextAccessor.HttpContext.RequestServices.GetService(type);
        }
        public static IEnumerable<object> GetServices(Type type)
        {
            return HttpContextAccessor.HttpContext.RequestServices.GetServices(type);
        }
    }
}