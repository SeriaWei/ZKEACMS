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
        public ZoneService(IPageService pageService, IApplicationContext applicationContext, IServiceProvider serviceProvder, CMSDbContext dbContext) 
            : base(applicationContext, dbContext)
        {
            PageService = pageService;
            _serviceProvder = serviceProvder;
        }

        public IPageService PageService { get; set; }

        public override DbSet<ZoneEntity> CurrentDbSet
        {
            get
            {
                return (DbContext as CMSDbContext).Zone;
            }
        }

        public override void Add(ZoneEntity item)
        {

            item.ID = Guid.NewGuid().ToString("N");

            if (item.HeadingCode.IsNullOrEmpty())
            {
                item.HeadingCode = item.ID;
            }
            base.Add(item);
        }
        public IEnumerable<ZoneEntity> GetZonesByPageId(string pageId)
        {
            var page = PageService.Get(pageId);
            using (var layoutService = _serviceProvder.GetService<ILayoutService>())
            {
                var layout = layoutService.Get(page.LayoutId);
                return CurrentDbSet.Where(m => m.LayoutId == layout.ID).OrderBy(m => m.ID).ToList();
            }


        }
        public IEnumerable<ZoneEntity> GetZonesByLayoutId(string layoutId)
        {
            return CurrentDbSet.Where(m => m.LayoutId == layoutId).OrderBy(m => m.ID);
        }
    }
}
