/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Net.Http.Headers;
using System;
using ZKEACMS.Event;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using ZKEACMS.Setting;
using ZKEACMS.Theme;
using ZKEACMS.Widget;

namespace ZKEACMS.Filter
{
    public class WidgetAttribute : ActionFilterAttribute, IActionFilter
    {

        public virtual PageEntity GetPage(ActionExecutedContext filterContext)
        {
            string path = filterContext.RouteData.GetPath();
            if (path.EndsWith("/") && path.Length > 1)
            {
                path = path.Substring(0, path.Length - 1);
                filterContext.Result = new RedirectResult(path);
                return null;
            }
            bool isPreView = IsPreView(filterContext);
            using (var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>())
            {
                if (!filterContext.HttpContext.User.Identity.IsAuthenticated && !isPreView && GetPageViewMode() == PageViewMode.Publish)
                {
                    filterContext.HttpContext.Response.GetTypedHeaders().CacheControl = new CacheControlHeaderValue()
                    {
                        Public = true,
                        MaxAge = TimeSpan.FromHours(1)
                    };
                    //filterContext.HttpContext.Response.Headers[HeaderNames.Vary] = new string[] { "Accept-Encoding" };
                }
                else if (isPreView)
                {
                    filterContext.HttpContext.Response.GetTypedHeaders().CacheControl = new CacheControlHeaderValue()
                    {
                        NoCache = true,
                        NoStore = true
                    };
                }
                return pageService.GetByPath(path, isPreView);
            }

        }
        private bool IsPreView(ActionExecutedContext filterContext)
        {
            bool isPreView = false;
            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                isPreView = ReView.Review.Equals(
                    filterContext.HttpContext.Request.Query[ReView.QueryKey],
                    StringComparison.OrdinalIgnoreCase);
            }
            return isPreView;
        }
        public virtual string GetLayout()
        {
            return "~/Views/Shared/_Layout.cshtml";
        }
        public virtual PageViewMode GetPageViewMode()
        {
            return PageViewMode.Publish;
        }
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            //Page
            var page = GetPage(filterContext);
            if (page != null)
            {

                var requestServices = filterContext.HttpContext.RequestServices;
                var onPageExecuteds = requestServices.GetServices<IOnPageExecuted>();
                var layoutService = requestServices.GetService<ILayoutService>();
                var widgetService = requestServices.GetService<IWidgetBasePartService>();
                var applicationSettingService = requestServices.GetService<IApplicationSettingService>();
                var themeService = requestServices.GetService<IThemeService>();
                var widgetActivator = requestServices.GetService<IWidgetActivator>();
                LayoutEntity layout = layoutService.Get(page.LayoutId);
                layout.Page = page;
                page.Favicon = applicationSettingService.Get(SettingKeys.Favicon, "~/favicon.ico");
                if (filterContext.HttpContext.User.Identity.IsAuthenticated && page.IsPublishedPage)
                {
                    layout.PreViewPage = requestServices.GetService<IPageService>().Get(page.ReferencePageID);
                }
                layout.CurrentTheme = themeService.GetCurrentTheme();
                layout.ZoneWidgets = new ZoneWidgetCollection();
                filterContext.HttpContext.TrySetLayout(layout);
                widgetService.GetAllByPage(page, GetPageViewMode() == PageViewMode.Publish && !IsPreView(filterContext)).Each(widget =>
                    {
                        if (widget != null)
                        {
                            IWidgetPartDriver partDriver = widgetActivator.Create(widget);
                            WidgetViewModelPart part = partDriver.Display(widget, filterContext);
                            if (part != null)
                            {
                                lock (layout.ZoneWidgets)
                                {
                                    if (layout.ZoneWidgets.ContainsKey(part.Widget.ZoneID))
                                    {
                                        layout.ZoneWidgets[part.Widget.ZoneID].TryAdd(part);
                                    }
                                    else
                                    {
                                        layout.ZoneWidgets.Add(part.Widget.ZoneID, new WidgetCollection { part });
                                    }
                                }
                            }
                            partDriver.Dispose();
                        }
                    });
                var viewResult = (filterContext.Result as ViewResult);
                if (viewResult != null)
                {
                    layout.Layout = GetLayout();
                    if (GetPageViewMode() == PageViewMode.Design)
                    {
                        layout.Templates = widgetService.Get(m => m.IsTemplate == true);
                    }
                    (filterContext.Controller as Controller).ViewData.Model = layout;
                }
                if (page.IsPublishedPage && onPageExecuteds != null)
                {
                    onPageExecuteds.Each(m => m.OnExecuted(page, filterContext.HttpContext));
                }

                layoutService.Dispose();
                applicationSettingService.Dispose();
                widgetService.Dispose();
                themeService.Dispose();
            }
            else
            {
                if (!(filterContext.Result is RedirectResult))
                {
                    var viewResult = filterContext.Result as ViewResult;
                    if (viewResult != null)
                    {
                        viewResult.StatusCode = 404;
                        viewResult.ViewName = "NotFound";
                    }
                    else
                    {
                        filterContext.Result = new RedirectResult("~/error/notfond?f=" + filterContext.HttpContext.Request.Path);
                    }
                }
            }
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var applicationContext = filterContext.HttpContext.RequestServices.GetService<IApplicationContextAccessor>();
            if (applicationContext != null)
            {
                applicationContext.Current.PageMode = GetPageViewMode();
                //applicationContext.RequestUrl = new Uri(filterContext.HttpContext.Request.Path.ToUriComponent());
            }
            var _onPageExecutings = filterContext.HttpContext.RequestServices.GetServices<IOnPageExecuting>();
            if (_onPageExecutings != null)
            {
                _onPageExecutings.Each(m => m.OnExecuting(filterContext.HttpContext));
            }
        }
    }

}
