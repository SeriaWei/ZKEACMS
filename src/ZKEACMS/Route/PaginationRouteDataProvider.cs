/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * 深圳市纸壳软件有限公司
 * http://www.zkea.net/licenses
 */

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
            if (CustomRegex.PageRegex.IsMatch(path))
            {
                int page = -1;
                path = CustomRegex.PageRegex.Replace(path, evaluator =>
                {
                    int.TryParse(evaluator.Groups[1].Value, out page);
                    return string.Empty;
                });
                if (page >= 0 && !values.ContainsKey(StringKeys.RouteValue_Page))
                {
                    values.Add(StringKeys.RouteValue_Page, page);
                }                
            }
            return path;
        }
    }
}
