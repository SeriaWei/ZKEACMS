/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ActionConstraints;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Net.Http.Headers;
using System;
using System.Linq;
using ZKEACMS.Event;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using ZKEACMS.Rule;
using ZKEACMS.Setting;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using ZKEACMS;
using System.IO;
using Microsoft.AspNetCore.Hosting;

namespace ZKEACMS.Filter
{
    public class WidgetAttribute : ActionFilterAttribute, IActionFilter, IActionConstraint
    {
        private const string UnknownZone = "UnknownZone";
        public virtual PageEntity GetPage(ActionExecutedContext filterContext)
        {
            string path = filterContext.RouteData.GetPath();
            bool isPreView = IsPreView(filterContext);
            using (var pageService = filterContext.HttpContext.RequestServices.GetService<IPageService>())
            {
                //if (!filterContext.HttpContext.User.Identity.IsAuthenticated && !isPreView && GetPageViewMode() == PageViewMode.Publish)
                //{
                //    filterContext.HttpContext.Response.GetTypedHeaders().CacheControl = new CacheControlHeaderValue()
                //    {
                //        Public = true,
                //        MaxAge = TimeSpan.FromHours(1)
                //    };
                //    //filterContext.HttpContext.Response.Headers[HeaderNames.Vary] = new string[] { "Accept-Encoding" };
                //}
                if (isPreView)
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
        private bool IsPreView(FilterContext filterContext)
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
        public virtual string GetLayout(ActionExecutedContext filterContext, ThemeEntity theme)
        {
            return Layouts.Default;
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
                var eventManager = requestServices.GetService<IEventManager>();
                var layoutService = requestServices.GetService<ILayoutService>();
                var widgetService = requestServices.GetService<IWidgetBasePartService>();
                var applicationSettingService = requestServices.GetService<IApplicationSettingService>();
                var themeService = requestServices.GetService<IThemeService>();
                var widgetActivator = requestServices.GetService<IWidgetActivator>();
                var ruleService = requestServices.GetService<IRuleService>();

                LayoutEntity layout = layoutService.GetByPage(page);
                layout.Page = page;
                page.Favicon = applicationSettingService.Get(SettingKeys.Favicon, "~/favicon.ico");
                if (filterContext.HttpContext.User.Identity.IsAuthenticated && page.IsPublishedPage)
                {
                    layout.PreViewPage = requestServices.GetService<IPageService>().Get(page.ReferencePageID);
                }
                layout.CurrentTheme = themeService.GetCurrentTheme();
                layout.ZoneWidgets = new ZoneWidgetCollection();
                filterContext.HttpContext.TrySetLayout(layout);
                widgetService.GetAllByPage(page).Each(widget =>
                    {
                        if (widget != null)
                        {
                            IWidgetPartDriver partDriver = widgetActivator.Create(widget);
                            WidgetViewModelPart part = partDriver.Display(widget, filterContext);
                            if (part != null)
                            {
                                if (layout.ZoneWidgets.ContainsKey(part.Widget.ZoneID ?? UnknownZone))
                                {
                                    layout.ZoneWidgets[part.Widget.ZoneID ?? UnknownZone].TryAdd(part);
                                }
                                else
                                {
                                    layout.ZoneWidgets.Add(part.Widget.ZoneID ?? UnknownZone, new WidgetCollection { part });
                                }
                            }
                            partDriver.Dispose();
                        }
                    });

                var ruleWorkContext = new RuleWorkContext
                {
                    Url = (filterContext.Controller as Controller).Url.Content(page.Url),
                    QueryString = filterContext.HttpContext.Request.QueryString.ToString(),
                    UserAgent = filterContext.HttpContext.Request.Headers["User-Agent"]
                };
                var rules = ruleService.GetMatchRule(ruleWorkContext);
                var rulesID = rules.Select(m => m.RuleID).ToArray();
                if (rules.Any())
                {
                    widgetService.GetAllByRule(rulesID, !IsPreView(filterContext)).Each(widget =>
                    {
                        if (widget != null)
                        {
                            IWidgetPartDriver partDriver = widgetActivator.Create(widget);
                            WidgetViewModelPart part = partDriver.Display(widget, filterContext);
                            var zone = layout.Zones.FirstOrDefault(z => z.ZoneName == rules.First(m => m.RuleID == widget.RuleID).ZoneName);
                            if (part != null && zone != null)
                            {
                                part.Widget.ZoneID = zone.HeadingCode;
                                if (layout.ZoneWidgets.ContainsKey(part.Widget.ZoneID ?? UnknownZone))
                                {
                                    layout.ZoneWidgets[part.Widget.ZoneID ?? UnknownZone].TryAdd(part);
                                }
                                else
                                {
                                    layout.ZoneWidgets.Add(part.Widget.ZoneID ?? UnknownZone, new WidgetCollection { part });
                                }

                            }
                            partDriver.Dispose();
                        }
                    });
                }
                var viewResult = (filterContext.Result as ViewResult);
                if (viewResult != null)
                {
                    layout.Layout = GetLayout(filterContext, layout.CurrentTheme);
                    if (GetPageViewMode() == PageViewMode.Design)
                    {
                        layout.Templates = widgetService.Get(m => m.IsTemplate == true);
                    }
                    (filterContext.Controller as Controller).ViewData.Model = layout;
                }
                if (page.IsPublishedPage)
                {
                    eventManager.Trigger(Events.OnPageExecuted, page);
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
                if (IsPreView(filterContext))
                {
                    applicationContext.Current.PageMode = PageViewMode.PreView;
                }
                else
                {
                    applicationContext.Current.PageMode = GetPageViewMode();
                }
            }
            var eventManager = filterContext.HttpContext.RequestServices.GetService<IEventManager>();
            eventManager.Trigger(Events.OnPageExecuting, filterContext);
        }

        public bool Accept(ActionConstraintContext context)
        {
            return context.Candidates.Count == 1;
        }
    }

}
