using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.DataArchived;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using CacheManager.Core;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS.Widget
{

    public class WidgetBasePartService : ServiceBase<WidgetBasePart>, IWidgetBasePartService
    {
        protected const string EncryptWidgetTemplate = "EncryptWidgetTemplate";
        private readonly IWidgetActivator _widgetActivator;
        private readonly IServiceProvider _serviceProvider;
        private readonly IHttpContextAccessor _httpContextAccessor;
        static ICacheManager<IEnumerable<WidgetBase>> PageWidgetCacheManage;
        static WidgetBasePartService()
        {
            PageWidgetCacheManage = CacheFactory.Build<IEnumerable<WidgetBase>>(setting =>
            {
                setting.WithDictionaryHandle("PageWidgets").WithExpiration(ExpirationMode.Sliding, new TimeSpan(0, 10, 0));
            });
        }
        public WidgetBasePartService(IApplicationContext applicationContext, IWidgetActivator widgetActivator, IServiceProvider serviceProvider, IHttpContextAccessor httpContextAccessor, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _widgetActivator = widgetActivator;
            _serviceProvider = serviceProvider;
            _httpContextAccessor = httpContextAccessor;
        }
        public override DbSet<WidgetBasePart> CurrentDbSet
        {
            get
            {
                return (DbContext as CMSDbContext).WidgetBasePart;
            }
        }
        private void TriggerChange(WidgetBase widget)
        {
            if (widget != null && widget.PageID.IsNotNullAndWhiteSpace())
            {
                using (var pageService = _serviceProvider.GetService<IPageService>())
                {
                    pageService.MarkChanged(widget.PageID);
                }
            }
            else if (widget != null && widget.LayoutID.IsNotNullAndWhiteSpace())
            {
                using (var layoutService = _serviceProvider.GetService<ILayoutService>())
                {
                    layoutService.MarkChanged(widget.LayoutID);
                }
                PageWidgetCacheManage.ClearRegion(_httpContextAccessor.HttpContext.Request.Host.Value);
            }
        }

        public IEnumerable<WidgetBase> GetByLayoutId(string layoutId)
        {
            return Get(m => m.LayoutID == layoutId);
        }
        public IEnumerable<WidgetBase> GetByPageId(string pageId)
        {
            return Get(m => m.PageID == pageId);
        }

        public IEnumerable<WidgetBase> GetAllByPage(PageEntity page, bool formCache = false)
        {
            Func<PageEntity, List<WidgetBase>> getPageWidgets = p =>
            {
                var result = GetByLayoutId(p.LayoutId);
                List<WidgetBase> widgets = result.ToList();
                widgets.AddRange(GetByPageId(p.ID));
                return widgets.Select(widget => _widgetActivator.Create(widget)?.GetWidget(widget)).ToList();
            };
            if (formCache)
            {
                return PageWidgetCacheManage.GetOrAdd(page.ReferencePageID, _httpContextAccessor.HttpContext.Request.Host.Value, (key, region) => getPageWidgets(page));
            }
            return getPageWidgets(page).Where(m => m != null);
        }
        public override void Add(WidgetBasePart item)
        {
            base.Add(item);
            TriggerChange(item);
        }
        public override void Update(WidgetBasePart item, bool saveImmediately = true)
        {
            TriggerChange(item);
            base.Update(item, saveImmediately);
        }
        public override void UpdateRange(params WidgetBasePart[] items)
        {
            items.Each(TriggerChange);
            base.UpdateRange(items);
        }
        public override void Remove(Expression<Func<WidgetBasePart, bool>> filter)
        {
            base.Remove(filter);
        }
        public override void Remove(WidgetBasePart item, bool saveImmediately = true)
        {
            TriggerChange(item);
            base.Remove(item, saveImmediately);
        }
        public override void RemoveRange(params WidgetBasePart[] items)
        {
            items.Each(TriggerChange);
            base.RemoveRange(items);
        }


        public WidgetViewModelPart ApplyTemplate(WidgetBase widget, ActionContext actionContext)
        {
            var widgetBasePart = Get(widget.ID);
            if (widgetBasePart == null) return null;

            var service = _widgetActivator.Create(widgetBasePart);
            var widgetBase = service.GetWidget(widgetBasePart.ToWidgetBase());

            widgetBase.PageID = widget.PageID;
            widgetBase.ZoneID = widget.ZoneID;
            widgetBase.Position = widget.Position;
            widgetBase.LayoutID = widget.LayoutID;
            widgetBase.IsTemplate = false;
            widgetBase.IsSystem = false;
            widgetBase.Thumbnail = null;

            var widgetPart = service.Display(widgetBase, actionContext);
            service.AddWidget(widgetBase);
            return widgetPart;
        }

        public void RemoveCache(string pageId)
        {
            PageWidgetCacheManage.Remove(pageId, _httpContextAccessor.HttpContext.Request.Host.Value);
        }
    }
}
