using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.Mvc.Route;

namespace ZKEACMS
{
    public class RouteProvider : IRouteProvider
    {
        public IEnumerable<RouteDescriptor> GetRoutes()
        {
            foreach (var item in RouteDescriptors.Routes)
            {
                yield return item;
            }
        }
    }
}
