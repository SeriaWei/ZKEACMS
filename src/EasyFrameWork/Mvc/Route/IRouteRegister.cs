/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;

namespace Easy.Mvc.Route
{
    public interface IRouteRegister
    {
        IEnumerable<RouteDescriptor> RegistRoute();
    }
}
