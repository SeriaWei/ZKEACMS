/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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

namespace ZKEACMS.Zone
{
    public class ZoneService : ServiceBase<ZoneEntity>, IZoneService
    {
        private readonly IServiceProvider _serviceProvder;
        private readonly ICacheManager<IEnumerable<ZoneEntity>> _cacheManager;
        public ZoneService(IApplicationContext applicationContext, IServiceProvider serviceProvder, ICacheManager<IEnumerable<ZoneEntity>> cacheManager, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _serviceProvder = serviceProvder;
            _cacheManager = cacheManager;
        }
        public override DbSet<ZoneEntity> CurrentDbSet => (DbContext as CMSDbContext).Zone;
        public override IQueryable<ZoneEntity> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public override ServiceResult<ZoneEntity> Add(ZoneEntity item)
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
            Func<string, string, IEnumerable<ZoneEntity>> get = (key, region) =>
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
              };
            if (page.IsPublishedPage)
            {
                return _cacheManager.GetOrAdd(page.ID, page.ReferencePageID, get);
            }
            return get(page.ID, page.ReferencePageID);
        }
        public IEnumerable<ZoneEntity> GetByLayoutId(string layoutId)
        {
            return Get().Where(m => m.LayoutId == layoutId && m.PageId == null).OrderBy(m => m.ID).ToList();
        }

        public void RemoveCache(string pageId)
        {
            _cacheManager.ClearRegion(pageId);
        }

        public void ClearCache()
        {
            _cacheManager.Clear();
        }
    }
}
