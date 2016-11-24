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

        public static string ValidateCode(this IUrlHelper helper)
        {
            return helper.Action("Code", "Validation", new { module = "Validation" });
        }

        public static string AddQueryToCurrentUrl(this IUrlHelper helper, string name, string value)
        {
            var query = QueryHelpers.ParseQuery(helper.ActionContext.HttpContext.Request.Path.Value);
            query[name] = value;
            return "{0}?{1}".FormatWith(helper.ActionContext.HttpContext.Request.PathBase.Value, query);
        }
    }
}
