/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using Easy.Extend;
using Easy.RepositoryPattern;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using Easy;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using Easy.Cache;
using Microsoft.Extensions.Caching.Memory;

namespace ZKEACMS.Zone
{
    public class ZoneService : ServiceBase<ZoneEntity, CMSDbContext>, IZoneService
    {
        private readonly IServiceProvider _serviceProvder;
        private readonly ICacheManager<ZoneService> _cacheManager;
        private readonly ISignals _signals;
        public ZoneService(IApplicationContext applicationContext, IServiceProvider serviceProvder, ICacheManager<ZoneService> cacheManager, ISignals signals, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _serviceProvder = serviceProvder;
            _cacheManager = cacheManager;
            _signals = signals;
        }
        public override DbSet<ZoneEntity> CurrentDbSet => DbContext.Zone;
        public override IQueryable<ZoneEntity> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public override ErrorOr<ZoneEntity> Add(ZoneEntity item)
        {

            item.ID = Guid.NewGuid().ToString("N");

            if (item.HeadingCode.IsNullOrEmpty())
            {
                item.HeadingCode = item.ID;
            }
            return base.Add(item);
        }
        public IEnumerable<ZoneEntity> GetByPage(PageEntity page)
        {
            IEnumerable<ZoneEntity> get()
            {
                IEnumerable<ZoneEntity> zones = Get().Where(m => m.PageId == page.ID).OrderBy(m => m.ID).ToList();
                if (!zones.Any())
                {
                    zones = GetByLayoutId(page.LayoutId);
                    if (ApplicationContext.IsAuthenticated)
                    {
                        foreach (var item in zones)
                        {
                            item.PageId = page.ID;
                            Add(item);
                        }
                    }
                }
                return zones;
            }
            if (page.IsPublishedPage)
            {
                return _cacheManager.GetOrCreate(page.ID, factory =>
                {
                    factory.AddExpirationToken(_signals.When(page.ID));
                    factory.AddExpirationToken(_signals.When(page.ReferencePageID));
                    factory.AddExpirationToken(_signals.When(CacheSignals.PageZoneChanged));
                    return get();
                });
            }
            return get();
        }
        public IEnumerable<ZoneEntity> GetByLayoutId(string layoutId)
        {
            return Get().Where(m => m.LayoutId == layoutId && m.PageId == null).OrderBy(m => m.ID).ToList();
        }

        public void RemoveCache(string pageId)
        {
            _signals.Trigger(pageId);
        }

        public void ClearCache()
        {
            _signals.Trigger(CacheSignals.PageZoneChanged);
        }
    }
}
