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
        public override DbSet<NavigationWidget> CurrentDbSet => (DbContext as CMSDbContext).NavigationWidget;
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            var currentWidget = widget as NavigationWidget;
            var navs = _navigationService.Get()
                .Where(m => m.Status == (int)RecordStatus.Active).OrderBy(m => m.DisplayOrder).ToList();
            if (actionContext is ActionExecutedContext)
            {
                string path = actionContext.HttpContext.Request.Path.Value.ToLower();
                NavigationEntity current = null;
                int length = 0;
                IUrlHelper urlHelper = ((actionContext as ActionExecutedContext).Controller as Controller).Url;
                foreach (var navigationEntity in navs)
                {
                    if (navigationEntity.Url.IsNotNullAndWhiteSpace()
                        && path.StartsWith(urlHelper.PathContent(navigationEntity.Url).ToLower())
                        && length < navigationEntity.Url.Length)
                    {
                        current = navigationEntity;
                        length = navigationEntity.Url.Length;
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