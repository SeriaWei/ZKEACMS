using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using ZKEACMS.Redirection.Service;
using Microsoft.Extensions.DependencyInjection;

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
            var redirect = httpContext.RequestServices.GetService<IUrlRedirectService>().GetAll()
                .Count(m => m.Status == (int)Easy.Constant.RecordStatus.Active &&
                m.InComingUrl.Equals(path, StringComparison.OrdinalIgnoreCase) &&
                !m.InComingUrl.Equals(m.DestinationURL, StringComparison.OrdinalIgnoreCase));

            return redirect > 0;
        }
    }
}
