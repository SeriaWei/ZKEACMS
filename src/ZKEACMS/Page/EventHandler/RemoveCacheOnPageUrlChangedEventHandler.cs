/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Cache;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Event;
using ZKEACMS.Widget;

namespace ZKEACMS.Page
{
    public class RemoveCacheOnPageUrlChangedEventHandler : IEventHandler
    {
        private readonly ICacheManager<IEnumerable<WidgetBase>> _pageWidgetCacheManager;
        private readonly ICacheManager<ConcurrentDictionary<string, object>> _concurrentCacheManager;

        public RemoveCacheOnPageUrlChangedEventHandler(ICacheManager<IEnumerable<WidgetBase>> pageWidgetCacheManage, 
            ICacheManager<ConcurrentDictionary<string, object>> concurrentCacheManager)
        {
            _pageWidgetCacheManager = pageWidgetCacheManage;
            _concurrentCacheManager = concurrentCacheManager;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                _pageWidgetCacheManager.Clear();
                _concurrentCacheManager.Clear();
            }
        }
    }
}
