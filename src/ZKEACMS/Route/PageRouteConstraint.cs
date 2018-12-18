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

namespace ZKEACMS
{
    public class PageRouteConstraint : IRouteConstraint
    {
        public bool Match(HttpContext httpContext, IRouter route, string routeKey, RouteValueDictionary values, RouteDirection routeDirection)
        {
            var value = values[routeKey];
            if (routeKey == "path" && value != null)
            {
                string path = "/" + value.ToString();

                var routeDataProviders = httpContext.RequestServices.GetService<IEnumerable<IRouteDataProvider>>();
                foreach (var item in routeDataProviders.OrderBy(m => m.Order))
                {
                    path = item.ExtractVirtualPath(path, values);
                }
                if (path.IsNullOrWhiteSpace())
                {
                    path = "/";
                }
                values[routeKey] = path;
            }
            return true;
        }
    }
}