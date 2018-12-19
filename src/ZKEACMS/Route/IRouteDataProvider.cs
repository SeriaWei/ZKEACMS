/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

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
