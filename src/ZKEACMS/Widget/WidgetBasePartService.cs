/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Cache;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Serializer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Event;
using ZKEACMS.Page;

namespace ZKEACMS.Widget
{

    public class WidgetBasePartService : ServiceBase<WidgetBasePart, CMSDbContext>, IWidgetBasePartService
    {
        protected const string EncryptWidgetTemplate = "EncryptWidgetTemplate";
        private readonly IWidgetActivator _widgetActivator;
        private readonly ICacheManager<WidgetBasePartService> _cacheManager;
        private readonly ISignals _signals;

        public WidgetBasePartService(IApplicationContext applicationContext,
            IWidgetActivator widgetActivator,
            ICacheManager<WidgetBasePartService> cacheManager,
            CMSDbContext dbContext, IEventManager eventManager, ISignals signals)
            : base(applicationContext, dbContext)
        {
            _widgetActivator = widgetActivator;
            _cacheManager = cacheManager;
            EventManager = eventManager;
            _signals = signals;
        }
        public IEventManager EventManager { get; private set; }
        public override DbSet<WidgetBasePart> CurrentDbSet => DbContext.WidgetBasePart;

        public override IQueryable<WidgetBasePart> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public IEnumerable<WidgetBase> GetByLayoutId(string layoutId)
        {
            return Get(m => m.LayoutId == layoutId);
        }
        public IEnumerable<WidgetBase> GetByPageId(string pageId)
        {
            return Get(m => m.PageId == pageId);
        }

        public IEnumerable<WidgetBase> GetAllByPage(PageEntity page)
        {
            List<WidgetBase> getPageWidgets(PageEntity p)
            {
                var result = GetByLayoutId(p.LayoutId);
                List<WidgetBase> widgets = result.ToList();
                widgets.AddRange(GetByPageId(p.ID));
                return widgets.Select(widget => _widgetActivator.Create(widget)?.GetWidget(widget)).ToList();
            }
            if (page.IsPublishedPage)
            {
                return _cacheManager.GetOrCreate(page.ID, factory =>
                {
                    factory.AddExpirationToken(_signals.When(page.ID));
                    factory.AddExpirationToken(_signals.When(page.ReferencePageID));
                    factory.AddExpirationToken(_signals.When(CacheSignals.PageWidgetChanged));
                    return getPageWidgets(page);
                });
            }
            return getPageWidgets(page).Where(m => m != null);
        }
        public IEnumerable<WidgetBase> GetAllByRule(int[] roleId, bool formCache = false)
        {
            List<WidgetBase> getWidgets(int[] p)
            {
                var result = Get(m => p.Contains(m.RuleID.Value));
                return result.Select(widget => _widgetActivator.Create(widget)?.GetWidget(widget)).ToList();
            }
            return getWidgets(roleId);
        }

        public override ServiceResult<WidgetBasePart> Update(WidgetBasePart item)
        {
            var result = base.Update(item);
            if (!result.HasError)
            {
                EventManager.Trigger(Events.OnWidgetBasePartUpdated, item);
            }
            return result;
        }

        public WidgetViewModelPart ApplyTemplate(Layout.LayoutEntity pageLayout, WidgetBase widget, ActionContext actionContext)
        {
            var widgetBasePart = Get(widget.ID);
            if (widgetBasePart == null) return null;

            var service = _widgetActivator.Create(widgetBasePart);
            var widgetBase = service.GetWidget(widgetBasePart.ToWidgetBase());

            widgetBase.PageId = widget.PageId;
            widgetBase.ZoneId = widget.ZoneId;
            widgetBase.Position = widget.Position;
            widgetBase.LayoutId = widget.LayoutId;
            widgetBase.IsTemplate = false;
            widgetBase.IsSystem = false;
            widgetBase.Thumbnail = null;
            widgetBase.RuleID = null;

            object viewModel = service.Display(new WidgetDisplayContext
            {
                PageLayout = pageLayout,
                Widget = widgetBase,
                ActionContext = actionContext
            });
            service.AddWidget(widgetBase);
            return new WidgetViewModelPart(widgetBase, viewModel);
        }
        public void RemoveCache(string pageId)
        {
            _signals.Trigger(pageId);
        }

        public void ClearCache()
        {
            _signals.Trigger(CacheSignals.PageWidgetChanged);
        }

        public IEnumerable<TWidget> GetAllWidgets<TWidgetService, TWidget>()
            where TWidgetService : SimpleWidgetService<TWidget>
            where TWidget : SimpleWidgetBase, new()
        {
            Type serviceType = typeof(TWidgetService);
            string serviceTypeName = serviceType.FullName;
            string assemblyName = serviceType.Assembly.GetName().Name;
            return Get(m => m.AssemblyName == assemblyName && m.ServiceTypeName == serviceTypeName).Select(m =>
            {
                TWidget widget = JsonConverter.Deserialize<TWidget>(m.ExtendData);
                m.CopyTo(widget);
                return widget;
            }).ToList();
        }

        public void UpdateWidgets<TWidget>(params TWidget[] widgets) where TWidget : SimpleWidgetBase, new()
        {
            BeginBulkSave();
            foreach (var item in widgets)
            {
                item.ExtendData = JsonConverter.Serialize(item);
                Update(item.ToWidgetBasePart());
            }
            EndBulkSave();
        }
    }
}
