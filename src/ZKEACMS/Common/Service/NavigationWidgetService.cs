/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Linq;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.ViewModels;
using Easy.Constant;
using Easy.Extend;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Http;
using Easy;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace ZKEACMS.Common.Service
{
    public class NavigationWidgetService : WidgetService<NavigationWidget>
    {
        private readonly INavigationService _navigationService;
        public NavigationWidgetService(IWidgetBasePartService widgetService, INavigationService navigationService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _navigationService = navigationService;
        }
        public override DbSet<NavigationWidget> CurrentDbSet => DbContext.NavigationWidget;
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            var currentWidget = widget as NavigationWidget;
            var navs = _navigationService.Get()
                .Where(m => m.Status == (int)RecordStatus.Active).OrderBy(m => m.DisplayOrder).ToList();

            string path = null;
            IUrlHelper urlHelper = null;
            if (ApplicationContext.As<CMSApplicationContext>().IsDesignMode)
            {
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    path = layout.Page.Url.Replace("~/", "/");
                }
            }
            else if (actionContext is ActionExecutedContext)
            {
                path = (actionContext as ActionExecutedContext).HttpContext.Request.Path.Value.Replace(".html", string.Empty);
                urlHelper = ((actionContext as ActionExecutedContext).Controller as Controller).Url;
            }
            if (urlHelper == null && (actionContext is ActionExecutedContext))
            {
                urlHelper = ((actionContext as ActionExecutedContext).Controller as Controller).Url;
            }

            if (path != null)
            {
                NavigationEntity current = null;
                int length = 0;
                foreach (var navigationEntity in navs)
                {
                    string url = (navigationEntity.Url ?? "~/").Replace(".html", string.Empty);
                    if (urlHelper != null)
                    {
                        url = urlHelper.Content(url);
                    }
                    else
                    {
                        url = url.Replace("~/", "/");
                    }
                    if (path.IndexOf(url, StringComparison.OrdinalIgnoreCase) == 0 && length < url.Length)
                    {
                        current = navigationEntity;
                        length = url.Length;
                    }
                }
                if (current != null)
                {
                    current.IsCurrent = true;
                }
            }


            if (currentWidget.RootID.IsNullOrEmpty() || currentWidget.RootID == "root")
            {
                currentWidget.RootID = "#";
            }
            return widget.ToWidgetViewModelPart(new NavigationWidgetViewModel(navs, currentWidget));
        }
    }
}