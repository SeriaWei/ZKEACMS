/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using Easy.Extend;
using ZKEACMS.Event;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using ZKEACMS.Setting;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Mvc.Filters;
using Easy.Mvc;
using Microsoft.AspNetCore.Mvc;
using Easy;
using Easy.Modules.User.Service;
using System.Linq;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;

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
            bool isPreView = false;
            if (filterContext.HttpContext.User.Identity.IsAuthenticated)
            {
                isPreView = ReView.Review.Equals(
                    filterContext.HttpContext.Request.Query[ReView.QueryKey],
                    StringComparison.CurrentCultureIgnoreCase);
            }
            using (var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>())
            {
                return pageService.GetByPath(path, isPreView);
            }

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
                var layoutService = filterContext.HttpContext.RequestServices.GetService<ILayoutService>();
                var widgetService = filterContext.HttpContext.RequestServices.GetService<IWidgetBasePartService>();
                var applicationSettingService = filterContext.HttpContext.RequestServices.GetService<IApplicationSettingService>();
                var themeService = filterContext.HttpContext.RequestServices.GetService<IThemeService>();
                var onPageExecuteds = filterContext.HttpContext.RequestServices.GetServices<IOnPageExecuted>();
                var widgetActivetor = filterContext.HttpContext.RequestServices.GetService<IWidgetActivetor>();

                LayoutEntity layout = layoutService.Get(page.LayoutId);
                layout.Page = page;
                page.Favicon = applicationSettingService.Get(SettingKeys.Favicon, "~/favicon.ico");
                if (filterContext.HttpContext.User.Identity.IsAuthenticated && page.IsPublishedPage)
                {
                    layout.PreViewPage = filterContext.HttpContext.RequestServices.GetService<IPageService>().GetByPath(page.Url, true);
                }
                layout.CurrentTheme = themeService.GetCurrentTheme();
                layout.ZoneWidgets = new ZoneWidgetCollection();
                filterContext.HttpContext.TrySetLayout(layout);
                widgetService.GetAllByPage(filterContext.HttpContext.RequestServices, page).Each(widget =>
                {
                    if (widget != null)
                    {
                        IWidgetPartDriver partDriver = widgetActivetor.Create(widget);
                        WidgetViewModelPart part = partDriver.Display(widget, filterContext);
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
                        partDriver.Dispose();
                    }
                });
                var viewResult = (filterContext.Result as ViewResult);
                if (viewResult != null)
                {
                    layout.Layout = GetLayout();
                    if (GetPageViewMode() == PageViewMode.Design)
                    {
                        layout.Templates = widgetService.Get(m => m.IsTemplate == true).ToList();
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
                filterContext.Result = new RedirectResult("~/error/notfond");
            }
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var applicationContext = filterContext.HttpContext.RequestServices.GetService<IApplicationContext>() as CMSApplicationContext;
            if (applicationContext != null)
            {
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
