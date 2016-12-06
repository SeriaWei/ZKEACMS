/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Easy.Extend;
using Easy.RepositoryPattern;
using ZKEACMS.DataArchived;
using ZKEACMS.Page;
using ZKEACMS.Widget;
using ZKEACMS.Zone;
using Easy;
using ZKEACMS.Layout;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Layout
{
    public class LayoutService : ServiceBase<LayoutEntity, CMSDbContext>, ILayoutService
    {
        public LayoutService(IDataArchivedService dataArchivedService,
            IPageService pageService,
            IZoneService zoneService,
            IWidgetService widgetService,
            IApplicationContext applicationContext,
            ILayoutHtmlService layoutHtmlService)
            : base(applicationContext)
        {
            DataArchivedService = dataArchivedService;
            PageService = pageService;
            ZoneService = zoneService;
            WidgetService = widgetService;
            LayoutHtmlService = layoutHtmlService;
        }
        public override DbSet<LayoutEntity> CurrentDbSet
        {
            get
            {
                return DbContext.Layout;
            }
        }
        public IDataArchivedService DataArchivedService { get; set; }
        public IPageService PageService { get; set; }
        public IZoneService ZoneService { get; set; }
        public ILayoutHtmlService LayoutHtmlService { get; set; }

        public IWidgetService WidgetService { get; set; }

        private string GenerateKey(object id)
        {
            return "Layout:" + id;
        }
        public override void Add(LayoutEntity item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            base.Add(item);
            if (item.Zones != null)
            {
                item.Zones.Each(m =>
                {
                    m.LayoutId = item.ID;
                    ZoneService.Add(m);
                });
            }
            if (item.Html != null)
            {
                item.Html.Each(m =>
                {
                    m.LayoutId = item.ID;
                    LayoutHtmlService.Add(m);
                });
            }
        }

        public void UpdateDesign(LayoutEntity item)
        {
            CurrentDbSet.Attach(item);
            DbContext.Entry(item).Property(m => m.ContainerClass).IsModified = true;
            DbContext.SaveChanges();

            if (item.Zones != null)
            {
                var zones = ZoneService.Get(m => m.LayoutId == item.ID);

                item.Zones.Where(m => zones.All(n => n.ID != m.ID)).Each(m =>
                {
                    m.LayoutId = item.ID;
                    ZoneService.Add(m);
                });
                item.Zones.Where(m => zones.Any(n => n.ID == m.ID)).Each(m =>
                {
                    m.LayoutId = item.ID;
                    ZoneService.Update(m);
                });
                zones.Where(m => item.Zones.All(n => n.ID != m.ID)).Each(m => ZoneService.Remove(m.ID));
            }
            if (item.Html != null)
            {
                LayoutHtmlService.Remove(m => m.LayoutId == item.ID);
                item.Html.Each(m =>
                {
                    m.LayoutId = item.ID;
                    LayoutHtmlService.Add(m);
                });
            }

        }
        public override void Update(LayoutEntity item)
        {
            MarkChanged(item.ID);
            base.Update(item);
        }
        public override void UpdateRange(params LayoutEntity[] items)
        {
            items.Each(m => MarkChanged(m.ID));
            base.UpdateRange(items);
        }


        public override LayoutEntity Get(params object[] primaryKeys)
        {
            //var layout = DataArchivedService.Get(GenerateKey(primaryKeys), () =>
            //{
            LayoutEntity entity = base.Get(primaryKeys);
            if (entity == null)
                return null;
            IEnumerable<ZoneEntity> zones = ZoneService.GetZonesByLayoutId(entity.ID);
            entity.Zones = new ZoneCollection();
            zones.Each(entity.Zones.Add);
            IEnumerable<LayoutHtml> htmls = LayoutHtmlService.GetByLayoutID(entity.ID);
            entity.Html = new LayoutHtmlCollection();
            htmls.Each(entity.Html.Add);
            return entity;
            //});
            //return layout;
        }
        public override void Remove(LayoutEntity item)
        {
            LayoutHtmlService.Remove(m => m.LayoutId == item.ID);
            ZoneService.Remove(m => m.LayoutId == item.ID);
            PageService.Remove(m => m.LayoutId == item.ID);
            var widgets = WidgetService.Get(m => m.LayoutID == item.ID);
            widgets.Each(m =>
            {
                using (var widgetService = m.CreateServiceInstance(ApplicationContext.ServiceLocator))
                {
                    widgetService.DeleteWidget(m.ID);
                }

            });

            MarkChanged(item.ID);
            base.Remove(item);
        }
        public override void Remove(params object[] primaryKey)
        {
            Remove(Get(primaryKey));
        }
        public override void Remove(Expression<Func<LayoutEntity, bool>> filter)
        {
            Get(filter).Each(layout =>
            {
                LayoutHtmlService.Remove(m => m.LayoutId == layout.ID);
                ZoneService.Remove(m => m.LayoutId == layout.ID);
                PageService.Remove(m => m.LayoutId == layout.ID);
                var widgets = WidgetService.Get(m => m.LayoutID == layout.ID);
                widgets.Each(m =>
                {
                    using (var widgetService = m.CreateServiceInstance(ApplicationContext.ServiceLocator))
                    {
                        widgetService.DeleteWidget(m.ID);
                    }
                });

                MarkChanged(layout.ID);
            });
            base.Remove(filter);
        }

        public override void RemoveRange(params LayoutEntity[] items)
        {
            items.Each(layout =>
            {
                LayoutHtmlService.Remove(m => m.LayoutId == layout.ID);
                ZoneService.Remove(m => m.LayoutId == layout.ID);
                PageService.Remove(m => m.LayoutId == layout.ID);
                var widgets = WidgetService.Get(m => m.LayoutID == layout.ID);
                widgets.Each(m =>
                {
                    using (var widgetService = m.CreateServiceInstance(ApplicationContext.ServiceLocator))
                    {
                        widgetService.DeleteWidget(m.ID);
                    }
                });

                MarkChanged(layout.ID);
            });
            base.RemoveRange(items);
        }


        public void MarkChanged(string ID)
        {
            DataArchivedService.Remove(GenerateKey(ID));
            PageService.Get(m => m.LayoutId == ID).Each(m =>
            {
                DataArchivedService.Remove(CacheTrigger.PageWidgetsArchivedKey.FormatWith(m.ID));
            });
        }
    }
}
