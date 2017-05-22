

using Easy.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Routing;

namespace ZKEACMS
{
    public class PageRouteConstraint : IRouteConstraint
    {
        public bool Match(HttpContext httpContext, IRouter route, string routeKey, RouteValueDictionary values, RouteDirection routeDirection)
        {
            var value = values[routeKey];
            if (routeKey == "path" && value != null)
            {
                string path = "/" + value.ToString();
                int postId = 0;
                int categoryId = 0;
                int page = 0;
                if (CustomRegex.PageRegex.IsMatch(path))
                {
                    path = CustomRegex.PageRegex.Replace(path, evaluator =>
                    {
                        int.TryParse(evaluator.Groups[1].Value, out page);
                        return "";
                    });
                    values.Add(StringKeys.RouteValue_Page, page);
                }

                if (CustomRegex.PostIdRegex.IsMatch(path))
                {
                    path = CustomRegex.PostIdRegex.Replace(path, evaluator =>
                    {
                        int.TryParse(evaluator.Groups[1].Value, out postId);
                        return "";
                    });
                }
                else if (CustomRegex.CategoryIdRegex.IsMatch(path))
                {
                    path = CustomRegex.CategoryIdRegex.Replace(path, evaluator =>
                    {
                        int.TryParse(evaluator.Groups[1].Value, out categoryId);
                        return "";
                    });
                }
                if (path.IsNullOrWhiteSpace())
                {
                    path = "/";
                }
                values[routeKey] = path;
                if (postId > 0)
                {
                    values.Add(StringKeys.RouteValue_Post, postId);
                }
                if (categoryId > 0)
                {
                    values.Add(StringKeys.RouteValue_Category, categoryId);
                }
            }
            return true;
        }
    }
}