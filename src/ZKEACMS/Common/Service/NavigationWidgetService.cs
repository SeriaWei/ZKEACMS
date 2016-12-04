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

namespace ZKEACMS.Common.Service
{
    public class NavigationWidgetService : WidgetService<NavigationWidget>
    {
        private readonly INavigationService _navigationService;
        public NavigationWidgetService(IWidgetService widgetService, INavigationService navigationService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _navigationService = navigationService;
        }
        public override WidgetPart Display(WidgetBase widget, HttpContext httpContext)
        {
            var navs = _navigationService.GetAll()
                .Where(m => m.Status == (int)RecordStatus.Active).OrderBy(m => m.DisplayOrder);
            string path = "~" + httpContext.Request.Path.Value.ToLower();
            NavigationEntity current = null;
            int length = 0;
            foreach (var navigationEntity in navs)
            {
                if (navigationEntity.Url.IsNotNullAndWhiteSpace()
                    && path.StartsWith(navigationEntity.Url.ToLower())
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
            return widget.ToWidgetPart(new NavigationWidgetViewModel(navs, widget as NavigationWidget));
        }
    }
}