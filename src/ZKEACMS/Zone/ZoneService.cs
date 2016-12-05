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

namespace ZKEACMS.Zone
{
    public class ZoneService : ServiceBase<ZoneEntity>, IZoneService
    {
        public ZoneService(IPageService pageService, IApplicationContext applicationContext) : base(applicationContext)
        {
            PageService = pageService;
        }

        public IPageService PageService { get; set; }

        public override void Add(ZoneEntity item)
        {
            if (item.ID.IsNullOrEmpty())
            {
                item.ID = Guid.NewGuid().ToString("N");
            }
            base.Add(item);
        }
        public IEnumerable<ZoneEntity> GetZonesByPageId(string pageId)
        {
            var page = PageService.Get(pageId);
            using (var layoutService = ApplicationContext.ServiceLocator.GetService<ILayoutService>())
            {
                var layout = layoutService.Get(page.LayoutId);
                return DbContext.Instance.Where(m => m.LayoutId == layout.ID).OrderBy(m => m.ID).ToList();
            }


        }
        public IEnumerable<ZoneEntity> GetZonesByLayoutId(string layoutId)
        {
            return DbContext.Instance.Where(m => m.LayoutId == layoutId).OrderBy(m => m.ID);
        }
    }
}
