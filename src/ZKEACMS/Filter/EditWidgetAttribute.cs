/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.Page;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Http;
using System;
using Microsoft.Net.Http.Headers;
using ZKEACMS.Theme;
using ZKEACMS.Layout;
using Microsoft.AspNetCore.Mvc;

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

        public override string GetLayout(ActionExecutedContext filterContext, ThemeEntity theme)
        {
            return Layouts.PageDesign;
        }
        public override PageViewMode GetPageViewMode()
        {
            return PageViewMode.Design;
        }
        public override void SetupPageResource(LayoutEntity layout, IPageContext pageContext, IUrlHelper urlHelper, bool isDevelopment)
        {
            pageContext.Meta.Add(new MetaTag(new { http_equiv = "cache-control", content = "no-cache" }));
            pageContext.Meta.Add(new MetaTag(new { http_equiv = "cache-control", content = "no-store" }));
            pageContext.Meta.Add(new MetaTag(new { http_equiv = "expires", content = "-1" }));
            pageContext.Meta.Add(new MetaTag(new { http_equiv = "pragma", content = "no-cache" }));
            base.SetupPageResource(layout, pageContext, urlHelper, isDevelopment);
        }
    }

}
