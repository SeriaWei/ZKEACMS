/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Page;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.Filter
{
    public class EditWidgetAttribute : WidgetAttribute
    {
        public override PageEntity GetPage(ActionExecutedContext filterContext)
        {
            string pageId = filterContext.RouteData.Values["id"].ToString();

            using (var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>())
            {
                return pageService.Get(pageId);
            }
            
        }

        public override string GetLayout()
        {
            return "~/Views/Shared/_DesignPageLayout.cshtml";
        }
        public override PageViewMode GetPageViewMode()
        {
            return PageViewMode.Design;
        }
    }

}
