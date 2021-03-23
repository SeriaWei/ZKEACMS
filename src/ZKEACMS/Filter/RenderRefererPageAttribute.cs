/*!
 * http://www.zkea.net/
 * Copyright 2020 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Microsoft.AspNetCore.Mvc.Filters;
using ZKEACMS.Page;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Mvc;
using Easy.Extend;
using System;

namespace ZKEACMS.Filter
{
    /// <summary>
    /// This is used to rebuild current page when submit form while validating model failed.
    /// </summary>
    public class RenderRefererPageAttribute : WidgetAttribute
    {
        private string GetPagePath(ActionExecutedContext filterContext)
        {
            string pagePath = filterContext.HttpContext.Request.Form["CurrentPagePath"];
            if (pagePath.IsNullOrWhiteSpace()) throw new Exception("Cannot find 'CurrentPagePath', please include @Html.HiddenForCurrentPagePath() in your form.");

            return pagePath;
        }
        public override PageEntity GetPage(ActionExecutedContext filterContext)
        {
            string pagePath = GetPagePath(filterContext);
            using (var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>())
            {
                return pageService.GetByPath(pagePath, false);
            }
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            if (filterContext.Result is ViewResult viewResult)
            {
                if (filterContext.ModelState.IsValid)
                {
                    RedirectToRefererPage(filterContext);
                }
                else
                {
                    RenderRefererPage(filterContext, viewResult);
                }
            }

        }

        private void RedirectToRefererPage(ActionExecutedContext filterContext)
        {
            filterContext.Result = new RedirectResult(GetPagePath(filterContext));
        }

        private void RenderRefererPage(ActionExecutedContext filterContext, ViewResult viewResult)
        {
            base.OnActionExecuted(filterContext);
            filterContext.RouteData.Values["controller"] = "page";
            filterContext.RouteData.Values["path"] = GetPagePath(filterContext);
            viewResult.ViewName = "PreView";
        }
    }

}
