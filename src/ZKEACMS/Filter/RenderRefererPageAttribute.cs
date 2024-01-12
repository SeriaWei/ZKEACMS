/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc.Filters;
using ZKEACMS.Page;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Mvc;
using Easy.Extend;
using System;
using System.Net;
using ZKEACMS.Route;
using System.Collections.Generic;
using System.Linq;

namespace ZKEACMS.Filter
{
    /// <summary>
    /// This is used to rebuild current page when submit form while validating model failed.
    /// </summary>
    public class RenderRefererPageAttribute : WidgetAttribute
    {
        private string GetPagePath(FilterContext filterContext)
        {
            return filterContext.HttpContext.Request.Form["CurrentPagePath"];
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string pagePath = GetPagePath(filterContext);
            if (pagePath.IsNullOrWhiteSpace())
            {
#if DEBUG
                throw new Exception("'CurrentPagePath' is empty, please include @Html.HiddenForCurrentPagePath() in your form.");
#else
                filterContext.Result = new BadRequestResult();
                return;
#endif
            }
            base.OnActionExecuting(filterContext);
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
            var routeDataProviders = filterContext.HttpContext.RequestServices.GetServices<IRouteDataProvider>();
            string pagePath = GetPagePath(filterContext);
            foreach (var routeDataProvider in routeDataProviders.OrderBy(m => m.Order))
            {
                pagePath = routeDataProvider.ExtractVirtualPath(pagePath, filterContext.RouteData.Values);
            }
            filterContext.RouteData.Values["controller"] = "page";
            filterContext.RouteData.Values["path"] = pagePath;
            viewResult.ViewName = "PreView";
            base.OnActionExecuted(filterContext);
        }
    }

}
