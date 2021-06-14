/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Route
{
    public interface IRouteDataProvider
    {
        int Order { get; }
        string ExtractVirtualPath(string path, RouteValueDictionary values);
    }
}
