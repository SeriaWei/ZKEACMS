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
        private static IHttpContextAccessor HttpContextAccessor;
        private static Type MetaDataType = typeof(ViewMetaData<>);
        public static void Setup(IHttpContextAccessor httpContextAccessor)
        {
            HttpContextAccessor = httpContextAccessor;
        }
        public static T GetService<T>()
        {
            if (HttpContextAccessor == null || HttpContextAccessor.HttpContext == null) return default(T);
            return HttpContextAccessor.HttpContext.RequestServices.GetService<T>();
        }
        public static IEnumerable<T> GetServices<T>()
        {
            if (HttpContextAccessor == null || HttpContextAccessor.HttpContext == null) return Enumerable.Empty<T>();
            return HttpContextAccessor.HttpContext.RequestServices.GetServices<T>();
        }
        public static object GetService(Type type)
        {
            if (HttpContextAccessor == null || HttpContextAccessor.HttpContext == null) return null;
            return HttpContextAccessor.HttpContext.RequestServices.GetService(type);
        }
        public static IEnumerable<object> GetServices(Type type)
        {
            if (HttpContextAccessor == null || HttpContextAccessor.HttpContext == null) return Enumerable.Empty<object>();
            return HttpContextAccessor.HttpContext.RequestServices.GetServices(type);
        }
        public static ViewConfigure GetViewConfigure(Type type)
        {
            if (type != null)
            {
                if (typeof(Microsoft.AspNetCore.Mvc.ControllerBase).IsAssignableFrom(type))
                {
                    return null;
                }
                var metaData = HttpContextAccessor.HttpContext.RequestServices.GetService(MetaDataType.MakeGenericType(type)) as IViewMetaData;
                if (metaData != null)
                {
                    return new ViewConfigure(metaData);
                }
            }
            return null;
        }
    }
}