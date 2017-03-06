using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS
{
    public static class RouteDescriptors
    {
        public static List<RouteDescriptor> Routes { get; } = new List<RouteDescriptor>
        {
             new RouteDescriptor
             {
                RouteName = "pageRoute",
                Template = "{*path}",
                Defaults = new { controller = "Page", action = "PreView" },
                Constraints = new { path = new PageRouteConstraint() },
                Priority = -1
             },
             new RouteDescriptor
             {
                RouteName = "admin",
                Template = "admin/{controller=Dashboard}/{action=index}",
                Priority = 10
             },
             new RouteDescriptor
             {
                RouteName = "Validation",
                Template = "validation/{action}",
                Defaults = new { controller = "Validation" },
                Priority = 10
             },
             new RouteDescriptor
             {
                RouteName = "error",
                Template = "error/{action}",
                Defaults = new { controller = "Error", action = "index" },
                Priority = 10
             },
             new RouteDescriptor
             {
                RouteName = "AccountAdmin",
                Template = "Account/{action}",
                Defaults = new { controller = "Account", action = "Login"},
                Priority = 10
             }
        };
    }
}
