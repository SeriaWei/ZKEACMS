/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.WebUtilities;

namespace ZKEACMS
{
    public static class UrlHelperExtend
    {
        public static string PathContent(this IUrlHelper helper, string path)
        {
            return helper.Content(path.IsNullOrEmpty() ? "~/" : path);
        }

        public static string ImageContent(this IUrlHelper helper,string path)
        {
            if (path.IsNullOrEmpty())
            {
                return helper.PathContent("~/images/not-img-available.jpg");
            }
            return helper.Content(path);
        }

        public static string ValidateCode(this IUrlHelper helper)
        {
            return helper.Action("Code", "Validation", new { module = "Validation" });
        }

        public static string AddQueryToCurrentUrl(this IUrlHelper helper, string name, string value)
        {
            return QueryHelpers.AddQueryString(helper.ActionContext.HttpContext.Request.Path, name, value);
        }

        public static string PostUrl(this IUrlHelper helper, string url, int id)
        {
            return PostUrl(helper, url, id.ToString());
        }
        public static string PostUrl(this IUrlHelper helper, string url, string id)
        {
            if (url.IsNullOrWhiteSpace())
            {
                url = "/";
            }
            return url + (url.EndsWith("/") ? "" : "/") + StringKeys.PathFormat(StringKeys.RouteValue_Post) + id;
        }
        public static string CategoryUrl(this IUrlHelper helper, int id)
        {
            return CategoryUrl(helper, id.ToString());
        }
        public static string CategoryUrl(this IUrlHelper helper, string id)
        {
            string url = helper.ActionContext.RouteData.GetPath();
            string currentCategory = helper.ActionContext.RouteData.GetCategory().ToString();
            if (currentCategory != id)
            {
                return url + (url.EndsWith("/") ? "" : "/") + StringKeys.PathFormat(StringKeys.RouteValue_Category) + id;
            }
            else
            {
                return url;
            }
        }
        public static string Page(this IUrlHelper helper, int pageIndex)
        {
            var category = helper.ActionContext.RouteData.GetCategory();
            if (category > 0)
            {
                return helper.ActionContext.RouteData.GetPath() +
                    "/" + StringKeys.PathFormat(StringKeys.RouteValue_Category) + category +
                    "/" + StringKeys.PathFormat(StringKeys.RouteValue_Page) + pageIndex;
            }
            return helper.ActionContext.RouteData.GetPath() + "/" + StringKeys.PathFormat(StringKeys.RouteValue_Page) + pageIndex;
        }
    }
}
