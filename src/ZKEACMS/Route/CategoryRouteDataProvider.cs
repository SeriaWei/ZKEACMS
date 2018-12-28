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
    public class CategoryRouteDataProvider : IRouteDataProvider
    {
        public int Order { get { return 1; } }
        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            if (CustomRegex.CategoryIdRegex.IsMatch(path))
            {
                int categoryId = 0;
                path = CustomRegex.CategoryIdRegex.Replace(path, evaluator =>
                {
                    int.TryParse(evaluator.Groups[1].Value, out categoryId);
                    return string.Empty;
                });
                if (categoryId > 0 && !values.ContainsKey(StringKeys.RouteValue_Category))
                {
                    values.Add(StringKeys.RouteValue_Category, categoryId);
                }
            }
            return path;
        }
    }
}
