/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
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
                Defaults = new { controller = "page", action = "main" },
                Constraints = new { path = new PageRouteConstraint() },
                Priority = -1
             },
             new RouteDescriptor
             {
                RouteName = "admin",
                Template = "admin/{controller=dashboard}/{action=index}/{id?}",
                Defaults=new { module = "admin" },
                Priority = 10
             },
             new RouteDescriptor
             {
                RouteName = "Validation",
                Template = "validation/{action}",
                Defaults = new { controller = "validation" },
                Priority = 11
             },
             new RouteDescriptor
             {
                RouteName = "error",
                Template = "error/{action}/{code?}",
                Defaults = new { controller = "error", action = "index" },
                Priority = 11
             },
             new RouteDescriptor
             {
                RouteName = "AccountAdmin",
                Template = "account/{action}",
                Defaults = new { controller = "account", action = "index"},
                Priority = 11
             }
        };
    }
}
