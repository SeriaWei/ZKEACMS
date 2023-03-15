/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Cache;
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Event;
using ZKEACMS.Page;

namespace ZKEACMS.Widget
{
    public sealed class WidgetChangedTriggerPageEventHandler : IEventHandler
    {
        private readonly IPageService _pageService;
        private readonly ICacheManager<IEnumerable<WidgetBase>> _pageWidgetCacheManage;
        private readonly HashSet<string> _pages;
        public WidgetChangedTriggerPageEventHandler(IPageService pageService, ICacheManager<IEnumerable<WidgetBase>> pageWidgetCacheManage)
        {
            _pageService = pageService;
            _pageWidgetCacheManage = pageWidgetCacheManage;
            _pages = new HashSet<string>();
        }

        public WidgetChangedTriggerPageEventHandler(IPageService pageService)
        {
            _pageService = pageService;
        }

        public void Handle(object entity, EventArg e)
        {
            WidgetBase widget = entity as WidgetBase;
            if (widget.PageId.IsNotNullAndWhiteSpace() && !_pages.Contains(widget.PageId))
            {
                _pages.Add(widget.PageId);
                _pageService.MarkChanged(widget.PageId);
            }
            if (widget.LayoutId.IsNotNullAndWhiteSpace())
            {
                _pageWidgetCacheManage.Clear();
            }
        }
    }
}
