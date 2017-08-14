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
            string path = $"~/{(values["path"] ?? "").ToString()}";
            var redirect = httpContext.RequestServices.GetService<IUrlRedirectService>().Get(m => m.Status == (int)Easy.Constant.RecordStatus.Active && m.InComingUrl == path);
            return redirect.Count() == 1 && redirect.First().InComingUrl != redirect.First().DestinationURL;
        }
    }
}
