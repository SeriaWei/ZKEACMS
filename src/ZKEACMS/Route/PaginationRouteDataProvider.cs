/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Routing;

namespace ZKEACMS.Route
{
    public class PaginationRouteDataProvider : IRouteDataProvider
    {
        public int Order { get { return 1; } }
        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            if (CustomRegex.PageIndex().IsMatch(path))
            {
                int page = -1;
                path = CustomRegex.PageIndex().Replace(path, evaluator =>
                {
                    int.TryParse(evaluator.Groups[1].Value, out page);
                    return string.Empty;
                });
                if (page >= 0)
                {
                    values.SetPage(page);
                }                
            }
            return path;
        }
    }
}
