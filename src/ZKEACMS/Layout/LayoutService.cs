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
    public class LayoutService : ServiceBase<LayoutEntity>, ILayoutService
    {
        public LayoutService(IDataArchivedService dataArchivedService,
            IZoneService zoneService,
            IWidgetBasePartService widgetService,
            IApplicationContext applicationContext,
            ILayoutHtmlService layoutHtmlService,
            IWidgetActivator widgetActivator,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            ZoneService = zoneService;
            WidgetService = widgetService;
            LayoutHtmlService = layoutHtmlService;
            WidgetActivator = widgetActivator;
        }
        public IZoneService ZoneService { get; set; }
        public ILayoutHtmlService LayoutHtmlService { get; set; }
        public IWidgetActivator WidgetActivator { get; set; }
        public IWidgetBasePartService WidgetService { get; set; }

        private string GenerateKey(object id)
        {
            return "Layout:" + id;
        }
        public override IQueryable<LayoutEntity> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }
        public override ServiceResult<LayoutEntity> Add(LayoutEntity item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            var result = base.Add(item);
            if (result.HasViolation)
            {
                return result;
            }
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
            return result;
        }

        public void UpdateDesign(LayoutEntity item)
        {
            if (item.Page != null && item.Page.ID.IsNotNullAndWhiteSpace())
            {
                if (item.Zones != null)
                {
                    var zones = ZoneService.GetByPage(new PageEntity { ID = item.Page.ID, LayoutId = item.ID });

                    item.Zones.Where(m => zones.All(n => n.ID != m.ID)).Each(m =>
                    {
                        m.LayoutId = item.ID;
                        m.PageId = item.Page.ID;
                        ZoneService.Add(m);
                    });
                    zones.Each(m =>
                    {
                        var changeZone = item.Zones.FirstOrDefault(z => z.ID == m.ID);
                        if (changeZone != null)
                        {
                            m.LayoutId = item.ID;
                            m.PageId = item.Page.ID;
                            m.Title = changeZone.Title;
                            m.ZoneName = changeZone.ZoneName;
                            ZoneService.Update(m);
                        }
                    });
                    zones.Where(m => item.Zones.All(n => n.ID != m.ID)).Each(m => ZoneService.Remove(m.ID));
                }
                if (item.Html != null)
                {
                    LayoutHtmlService.Remove(m => m.PageId == item.Page.ID);
                    item.Html.Each(m =>
                    {
                        m.LayoutId = item.ID;
                        m.PageId = item.Page.ID;
                        LayoutHtmlService.Add(m);
                    });
                }
            }
            else
            {
                if (item.Zones != null)
                {
                    var zones = ZoneService.Get(m => m.LayoutId == item.ID);

                    item.Zones.Where(m => zones.All(n => n.ID != m.ID)).Each(m =>
                    {
                        m.LayoutId = item.ID;
                        ZoneService.Add(m);
                    });
                    zones.Each(m =>
                    {
                        var changeZone = item.Zones.FirstOrDefault(z => z.ID == m.ID);
                        if (changeZone != null)
                        {
                            m.LayoutId = item.ID;
                            m.Title = changeZone.Title;
                            m.ZoneName = changeZone.ZoneName;
                            ZoneService.Update(m);
                        }
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


        }
        public override ServiceResult<LayoutEntity> Update(LayoutEntity item)
        {
            MarkChanged(item.ID);
            return base.Update(item);
        }
        public override ServiceResult<LayoutEntity> UpdateRange(params LayoutEntity[] items)
        {
            items.Each(m => MarkChanged(m.ID));
            return base.UpdateRange(items);
        }


        public override LayoutEntity Get(params object[] primaryKeys)
        {
            LayoutEntity entity = base.Get(primaryKeys);
            if (entity == null)
                return null;
            IEnumerable<ZoneEntity> zones = ZoneService.GetByLayoutId(entity.ID);
            entity.Zones = new ZoneCollection();
            zones.Each(entity.Zones.Add);
            IEnumerable<LayoutHtml> htmls = LayoutHtmlService.GetByLayoutID(entity.ID);
            entity.Html = new LayoutHtmlCollection();
            htmls.Each(entity.Html.Add);
            return entity;
        }
        public LayoutEntity GetByPage(PageEntity page)
        {
            LayoutEntity entity = new LayoutEntity { ID = page.LayoutId };
            IEnumerable<ZoneEntity> zones = ZoneService.GetByPage(page);
            entity.Zones = new ZoneCollection();
            zones.Each(entity.Zones.Add);
            IEnumerable<LayoutHtml> htmls = LayoutHtmlService.GetByPage(page);
            entity.Html = new LayoutHtmlCollection();
            htmls.Each(entity.Html.Add);
            return entity;
        }
        public IList<LayoutEntity> GetWithFull()
        {
            var layouts = Get().ToList();
            var zones = ZoneService.Get().ToList();
            var htmls = LayoutHtmlService.Get().ToList();
            foreach (var item in layouts)
            {
                item.Zones = new ZoneCollection();
                zones.Where(m => m.LayoutId == item.ID && m.PageId == null).Each(item.Zones.Add);
                item.Html = new LayoutHtmlCollection();
                htmls.Where(m => m.LayoutId == item.ID && m.PageId == null).Each(item.Html.Add);
            }
            return layouts;
        }
        public override void Remove(LayoutEntity item)
        {
            var changeTo = Get().Where(m => m.ID != item.ID).FirstOrDefault();
            if (changeTo != null)
            {
                BeginTransaction(() =>
                {
                    LayoutHtmlService.Remove(m => m.LayoutId == item.ID && m.PageId == null);
                    ZoneService.Remove(m => m.LayoutId == item.ID && m.PageId == null);
                    var widgets = WidgetService.Get(m => m.LayoutID == item.ID);
                    widgets.Each(m =>
                    {
                        using (var widgetService = WidgetActivator.Create(m))
                        {
                            widgetService.DeleteWidget(m.ID);
                        }
                    });

                    base.Remove(item);
                });

            }

        }

        public void MarkChanged(string ID)
        {

        }
    }
}
