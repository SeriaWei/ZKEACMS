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
        private readonly IZoneService _zoneService;
        private readonly ILayoutHtmlService _layoutHtmlService;
        private readonly IWidgetActivator _widgetActivator;
        private readonly IWidgetBasePartService _widgetService;

        public LayoutService(IDataArchivedService dataArchivedService,
            IZoneService zoneService,
            IWidgetBasePartService widgetService,
            IApplicationContext applicationContext,
            ILayoutHtmlService layoutHtmlService,
            IWidgetActivator widgetActivator,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _zoneService = zoneService;
            _widgetService = widgetService;
            _layoutHtmlService = layoutHtmlService;
            _widgetActivator = widgetActivator;
        }

        public override DbSet<LayoutEntity> CurrentDbSet => (DbContext as CMSDbContext).Layout;
        

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
                    _zoneService.Add(m);
                });
            }
            if (item.Html != null)
            {
                item.Html.Each(m =>
                {
                    m.LayoutId = item.ID;
                    _layoutHtmlService.Add(m);
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
                    var zones = _zoneService.GetByPage(new PageEntity { ID = item.Page.ID, LayoutId = item.ID });

                    item.Zones.Where(m => zones.All(n => n.ID != m.ID)).Each(m =>
                    {
                        m.LayoutId = item.ID;
                        m.PageId = item.Page.ID;
                        _zoneService.Add(m);
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
                            _zoneService.Update(m);
                        }
                    });
                    zones.Where(m => item.Zones.All(n => n.ID != m.ID)).Each(m => _zoneService.Remove(m.ID));
                }
                if (item.Html != null)
                {
                    _layoutHtmlService.Remove(m => m.PageId == item.Page.ID);
                    item.Html.Each(m =>
                    {
                        m.LayoutId = item.ID;
                        m.PageId = item.Page.ID;
                        _layoutHtmlService.Add(m);
                    });
                }
            }
            else
            {
                if (item.Zones != null)
                {
                    var zones = _zoneService.Get(m => m.LayoutId == item.ID);

                    item.Zones.Where(m => zones.All(n => n.ID != m.ID)).Each(m =>
                    {
                        m.LayoutId = item.ID;
                        _zoneService.Add(m);
                    });
                    zones.Each(m =>
                    {
                        var changeZone = item.Zones.FirstOrDefault(z => z.ID == m.ID);
                        if (changeZone != null)
                        {
                            m.LayoutId = item.ID;
                            m.Title = changeZone.Title;
                            m.ZoneName = changeZone.ZoneName;
                            _zoneService.Update(m);
                        }
                    });
                    zones.Where(m => item.Zones.All(n => n.ID != m.ID)).Each(m => _zoneService.Remove(m.ID));
                }
                if (item.Html != null)
                {
                    _layoutHtmlService.Remove(m => m.LayoutId == item.ID);
                    item.Html.Each(m =>
                    {
                        m.LayoutId = item.ID;
                        _layoutHtmlService.Add(m);
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
            IEnumerable<ZoneEntity> zones = _zoneService.GetByLayoutId(entity.ID);
            entity.Zones = new ZoneCollection();
            zones.Each(entity.Zones.Add);
            IEnumerable<LayoutHtml> htmls = _layoutHtmlService.GetByLayoutID(entity.ID);
            entity.Html = new LayoutHtmlCollection();
            htmls.Each(entity.Html.Add);
            return entity;
        }
        public LayoutEntity GetByPage(PageEntity page)
        {
            LayoutEntity entity = new LayoutEntity { ID = page.LayoutId };
            IEnumerable<ZoneEntity> zones = _zoneService.GetByPage(page);
            entity.Zones = new ZoneCollection();
            zones.Each(entity.Zones.Add);
            IEnumerable<LayoutHtml> htmls = _layoutHtmlService.GetByPage(page);
            entity.Html = new LayoutHtmlCollection();
            htmls.Each(entity.Html.Add);
            return entity;
        }
        public IList<LayoutEntity> GetWithFull()
        {
            var layouts = Get().ToList();
            var zones = _zoneService.Get().ToList();
            var htmls = _layoutHtmlService.Get().ToList();
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
                    _layoutHtmlService.Remove(m => m.LayoutId == item.ID && m.PageId == null);
                    _zoneService.Remove(m => m.LayoutId == item.ID && m.PageId == null);
                    var widgets = _widgetService.Get(m => m.LayoutID == item.ID);
                    widgets.Each(m =>
                    {
                        using (var widgetService = _widgetActivator.Create(m))
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
