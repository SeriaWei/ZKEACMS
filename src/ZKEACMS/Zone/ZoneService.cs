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

namespace ZKEACMS.Zone
{
    public class ZoneService : ServiceBase<ZoneEntity>, IZoneService
    {
        private readonly IServiceProvider _serviceProvder;
        public ZoneService(IApplicationContext applicationContext, IServiceProvider serviceProvder, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _serviceProvder = serviceProvder;
        }
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
        public IEnumerable<ZoneEntity> GetZonesByPage(PageEntity page)
        {
            IEnumerable<ZoneEntity> zones = Get().Where(m => m.PageId == page.ID).OrderBy(m => m.ID).ToList();
            if (!zones.Any())
            {
                zones = GetZonesByLayoutId(page.LayoutId);
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
        public IEnumerable<ZoneEntity> GetZonesByLayoutId(string layoutId)
        {
            return Get().Where(m => m.LayoutId == layoutId && m.PageId == null).OrderBy(m => m.ID).ToList();
        }
    }
}
