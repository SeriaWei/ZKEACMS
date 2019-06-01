/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

using Easy.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using ZKEACMS.Route;
using System.Linq;
using ZKEACMS.Page;

namespace ZKEACMS
{
    public class PageRouteConstraint : IRouteConstraint
    {
        public bool Match(HttpContext httpContext, IRouter route, string routeKey, RouteValueDictionary values, RouteDirection routeDirection)
        {
            if (routeDirection == RouteDirection.UrlGeneration) return false;

            const string start = "/";
            string path = start;
           
            path = $"{start}{values[routeKey]}";

            if (path != start)
            {
                var routeDataProviders = httpContext.RequestServices.GetService<IEnumerable<IRouteDataProvider>>();
                foreach (var item in routeDataProviders.OrderBy(m => m.Order))
                {
                    path = item.ExtractVirtualPath(path, values);
                }
            }
            values[routeKey] = path.ToLower();
            if (path == start) return true;
            return httpContext.RequestServices.GetService<IPageService>().IsExists(path);
        }
    }
}