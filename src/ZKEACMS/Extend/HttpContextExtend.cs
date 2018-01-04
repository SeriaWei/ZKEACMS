/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Layout;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS
{
    public static class HttpContextExtend
    {
        public static void TrySetLayout(this HttpContext httpContext, LayoutEntity layout)
        {
            if (!httpContext.Items.ContainsKey(StringKeys.LayoutItem))
            {
                httpContext.Items.Add(StringKeys.LayoutItem, layout);
            }
        }
        public static LayoutEntity GetLayout(this HttpContext httpContext)
        {
            if (httpContext.Items.ContainsKey(StringKeys.LayoutItem))
            {
                return httpContext.Items[StringKeys.LayoutItem] as LayoutEntity;
            }
            return null;
        }
    }
}
