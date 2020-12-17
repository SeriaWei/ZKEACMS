using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Redirection.Service;
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection
{
    public class RedirectRouteConstraint : IRouteConstraint
    {
        public bool Match(HttpContext httpContext, IRouter route, string routeKey, RouteValueDictionary values, RouteDirection routeDirection)
        {
            if (routeDirection == RouteDirection.UrlGeneration) return false;

            string path = $"~/{values[routeKey]}";
            if (path.Length > 2 && path.EndsWith('/'))
            {
                path = path.TrimEnd('/');
            }
            if (path.IndexOf(".html", StringComparison.OrdinalIgnoreCase) < 0 && CustomRegex.PostIdRegex.IsMatch(path))
            {
                return true;
            }
            UrlRedirect redirect = httpContext.RequestServices.GetService<IUrlRedirectService>().GetByPath(path);

            return redirect != null;
        }
    }
}
