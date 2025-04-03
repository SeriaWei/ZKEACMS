/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using Easy.MetaData;
using System.Linq;

namespace Easy
{
    public static class ServiceLocator
    {
        private static IServiceScope AppScopedServiceProvider;
        private static Type MetaDataType = typeof(ViewMetaData<>);
        public static void Setup(IServiceProvider serviceProvider)
        {
            AppScopedServiceProvider = serviceProvider.CreateScope();
        }
        private static IServiceProvider GetServiceProvider()
        {
            var httpContextAccessor = AppScopedServiceProvider.ServiceProvider.GetService<IHttpContextAccessor>();
            if (httpContextAccessor == null || httpContextAccessor.HttpContext == null) return AppScopedServiceProvider.ServiceProvider;

            return httpContextAccessor.HttpContext.RequestServices;
        }
        public static T GetService<T>()
        {
            return GetServiceProvider().GetService<T>();
        }
        public static IEnumerable<T> GetServices<T>()
        {
            return GetServiceProvider().GetServices<T>();
        }
        public static object GetService(Type type)
        {
            return GetServiceProvider().GetService(type);
        }
        public static IEnumerable<object> GetServices(Type type)
        {
            return GetServiceProvider().GetServices(type);
        }
        public static ViewConfigure GetViewConfigure(Type type)
        {
            if (type != null && AppScopedServiceProvider.ServiceProvider.GetService<IHttpContextAccessor>() != null)
            {
                if (typeof(Microsoft.AspNetCore.Mvc.ControllerBase).IsAssignableFrom(type))
                {
                    return null;
                }
                var metaData = GetServiceProvider().GetService(MetaDataType.MakeGenericType(type)) as IViewMetaData;
                if (metaData != null)
                {
                    return new ViewConfigure(metaData);
                }
            }
            return null;
        }
    }
}