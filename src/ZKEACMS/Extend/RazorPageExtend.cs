/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.AspNetCore.WebUtilities;

namespace ZKEACMS
{
    public static class RazorPageExtend
    {
        public static CMSApplicationContext WorkContext<T>(this Easy.Mvc.RazorPages.EasyRazorPage<T> page)
        {
            return page.ApplicationContext.As<CMSApplicationContext>();
        }
    }
}
