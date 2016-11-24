/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;

namespace Easy.Mvc.Route
{
    public interface IRouteRegister
    {
        IEnumerable<RouteDescriptor> RegistRoute();
    }
}
