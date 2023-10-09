/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Routing;

namespace ZKEACMS.Route
{
    public class CategoryRouteDataProvider : IRouteDataProvider
    {
        public int Order { get { return 1; } }
        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            if (CustomRegex.CategoryId().IsMatch(path))
            {
                int categoryId = 0;
                path = CustomRegex.CategoryId().Replace(path, evaluator =>
                {
                    int.TryParse(evaluator.Groups[1].Value, out categoryId);
                    return string.Empty;
                });
                if (categoryId > 0)
                {
                    values.SetCategory(categoryId);
                }
            }
            return path;
        }
    }
}
