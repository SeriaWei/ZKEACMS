/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using ZKEACMS.Page;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using System;
using Microsoft.Net.Http.Headers;

namespace ZKEACMS.Filter
{
    public class EditWidgetAttribute : WidgetAttribute
    {
        public override PageEntity GetPage(ActionExecutedContext filterContext)
        {
            filterContext.HttpContext.Response.GetTypedHeaders().CacheControl = new CacheControlHeaderValue()
            {
                NoCache = true,
                NoStore = true
            };
            var pageId = filterContext.RouteData.Values["id"];
            if (pageId == null)
            {
                return null;
            }

            using (var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>())
            {
                return pageService.Get(pageId.ToString());
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
