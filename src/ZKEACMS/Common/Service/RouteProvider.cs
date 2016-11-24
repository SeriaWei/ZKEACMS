using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.Mvc.Route;

namespace ZKEACMS.Common.Service
{
    public class RouteProvider : IRouteProvider
    {
        public IEnumerable<RouteDescriptor> GetRoutes()
        {
            yield return new RouteDescriptor
            {
                RouteName = "pageRoute",
                Template = "{*path}",
                Defaults = new { controller = "Page", action = "PreView" },
                Priority = -1
            };
            yield return new RouteDescriptor
            {
                RouteName = "admin",
                Template = "admin/{controller=Dashboard}/{action=index}",
                Priority = 10
            };
            yield return new RouteDescriptor
            {
                RouteName = "Validation",
                Template = "validation/{action}",
                Defaults = new { controller = "Validation" },
                Priority = 10
            };
            yield return new RouteDescriptor
            {
                RouteName = "error",
                Template = "error/{action}",
                Defaults = new { controller = "Error", action = "index" },
                Priority = 10
            };
            yield return new RouteDescriptor
            {
                RouteName = "AccountAdmin",
                Template = "Account/{action}",
                Defaults = new { controller = "Account", action = "Login"},
                Priority = 10
            };
            foreach (var item in RouteDescriptors.Routes)
            {
                yield return item;
            }
        }
    }
}
