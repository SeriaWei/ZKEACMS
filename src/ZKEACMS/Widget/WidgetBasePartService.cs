/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
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
using Easy.Cache;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS.Widget
{

    public class WidgetBasePartService : ServiceBase<WidgetBasePart, CMSDbContext>, IWidgetBasePartService
    {
        protected const string EncryptWidgetTemplate = "EncryptWidgetTemplate";
        private readonly IWidgetActivator _widgetActivator;
        private readonly IServiceProvider _serviceProvider;
        private readonly ICacheManager<IEnumerable<WidgetBase>> _pageWidgetCacheManage;
        public WidgetBasePartService(IApplicationContext applicationContext,
            IWidgetActivator widgetActivator,
            IServiceProvider serviceProvider,
            ICacheManager<IEnumerable<WidgetBase>> pageWidgetCacheManage,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _widgetActivator = widgetActivator;
            _serviceProvider = serviceProvider;
            _pageWidgetCacheManage = pageWidgetCacheManage;
            IsNeedNotifyChange = true;
        }
        public override DbSet<WidgetBasePart> CurrentDbSet => DbContext.WidgetBasePart;
        public bool IsNeedNotifyChange { get; set; }

        private void TriggerChange(WidgetBase widget)
        {
            if (IsNeedNotifyChange)
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
                        ClearCache();
                    }
                }
            }

        }

        public override IQueryable<WidgetBasePart> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public IEnumerable<WidgetBase> GetByLayoutId(string layoutId)
        {
            return Get(m => m.LayoutID == layoutId);
        }
        public IEnumerable<WidgetBase> GetByPageId(string pageId)
        {
            return Get(m => m.PageID == pageId);
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
                return _pageWidgetCacheManage.GetOrAdd(page.ID, page.ReferencePageID, (key, region) => getPageWidgets(page));
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

        public override ServiceResult<WidgetBasePart> Add(WidgetBasePart item)
        {
            var result = base.Add(item);
            if (!result.HasViolation)
            {
                TriggerChange(item);
            }
            return result;
        }
        public override ServiceResult<WidgetBasePart> Update(WidgetBasePart item)
        {
            var result = base.Update(item);
            if (!result.HasViolation)
            {
                TriggerChange(item);
            }
            return result;
        }
        public override ServiceResult<WidgetBasePart> UpdateRange(params WidgetBasePart[] items)
        {
            var result = base.UpdateRange(items);
            if (!result.HasViolation)
            {
                items.Each(TriggerChange);
            }
            return result;
        }
        public override void Remove(Expression<Func<WidgetBasePart, bool>> filter)
        {
            base.Remove(filter);
        }
        public override void Remove(WidgetBasePart item)
        {
            TriggerChange(item);
            base.Remove(item);
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
            widgetBase.RuleID = null;

            var widgetPart = service.Display(widgetBase, actionContext);
            service.AddWidget(widgetBase);
            return widgetPart;
        }
        public void RemoveCache(string pageId)
        {
            _pageWidgetCacheManage.ClearRegion(pageId);
        }

        public void ClearCache()
        {
            _pageWidgetCacheManage.Clear();
        }
    }
}
