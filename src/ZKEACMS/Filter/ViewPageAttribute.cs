/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Microsoft.AspNetCore.Mvc.Filters;
using ZKEACMS.Page;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.Filter
{
    public class ViewPageAttribute : WidgetAttribute
    {
        public override PageEntity GetPage(ActionExecutedContext filterContext)
        {
            string pageId = filterContext.RouteData.Values["id"].ToString();
            using (var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>())
            {
                return pageService.Get(pageId);
            }
        }

        public override PageViewMode GetPageViewMode()
        {
            return PageViewMode.ViewOnly;
        }
    }

}
