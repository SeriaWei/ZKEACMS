using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS
{
    public interface IRouteProvider
    {
        IEnumerable<RouteDescriptor> GetRoutes();
    }
}
