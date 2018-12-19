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
    public class PostIdRouteDataProvider : IRouteDataProvider
    {
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            if (CustomRegex.PostIdRegex.IsMatch(path))
            {
                int postId = 0;
                path = CustomRegex.PostIdRegex.Replace(path, evaluator =>
                {
                    int.TryParse(evaluator.Groups[1].Value, out postId);
                    return string.Empty;
                });
                if (postId > 0 && !values.ContainsKey(StringKeys.RouteValue_Post))
                {
                    values.Add(StringKeys.RouteValue_Post, postId);
                }
            }
            return path;
        }
    }
}
