/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy;
using ZKEACMS.Common.ViewModels;
using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using ZKEACMS.Widget;
using ZKEACMS.Zone;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class LayoutController : BasicController<LayoutEntity, string, ILayoutService>
    {
        private readonly IPageService _pageService;
        private readonly IZoneService _zoneService;
        private readonly IWidgetBasePartService _widgetService;
        public LayoutController(ILayoutService service, IPageService pageService, IZoneService zoneService, IWidgetBasePartService widgetService)
            : base(service)
        {
            _pageService = pageService;
            _zoneService = zoneService;
            _widgetService = widgetService;
        }


        public override ActionResult Index()
        {
            return View(Service.Get(m => !m.IsTemplate));
        }

        public ActionResult LayoutWidget(string LayoutID)
        {
            ViewBag.LayoutID = LayoutID;
            return View(Service.Get(m => !m.IsTemplate));
        }
        [HttpPost]
        public ActionResult LayoutZones(string ID)
        {
            var layout = Service.Get(ID);
            var viewModel = new LayoutZonesViewModel
            {
                Layout = layout,
                LayoutID = ID,
                Zones = _zoneService.GetZonesByLayoutId(ID),
                Widgets = _widgetService.GetByLayoutId(ID),
                LayoutHtml = layout.Html
            };
            return View(viewModel);
        }

        public override ActionResult Create()
        {
            return View(new LayoutEntity { ImageUrl = LayoutEntity.DefaultThumbnial, ImageThumbUrl = LayoutEntity.DefaultThumbnial });
        }
        [HttpPost]
        public override ActionResult Create(LayoutEntity entity)
        {
            base.Create(entity);
            return RedirectToAction("Design", new { entity.ID });
        }

        public override ActionResult Edit(string ID)
        {
            return base.Edit(ID);
        }

        [HttpPost]
        public override ActionResult Edit(LayoutEntity entity)
        {
            if (entity.ActionType == ActionType.Design)
            {
                return RedirectToAction("Design", new { entity.ID });
            }
            return base.Edit(entity);
        }
        public ActionResult Design(string ID, string PageID)
        {
            // Stop Caching in IE


            // Stop Caching in Firefox

            LayoutEntity layout = null;
            if (ID.IsNotNullAndWhiteSpace())
            {
                layout = Service.Get(ID);
            }
            if (PageID.IsNotNullAndWhiteSpace())
            {
                layout.Page = new PageEntity { ID = PageID };
            }
            return View(layout ?? new LayoutEntity());
        }

        public ActionResult SaveLayout(string[] html, LayoutEntity layout, ZoneCollection zones)
        {
            layout.Html = Helper.GenerateHtml(html, zones);
            layout.Zones = zones;
            Service.UpdateDesign(layout);
            if (layout.Page != null)
            {
                return RedirectToAction("Design", "Page", new { layout.Page.ID });
            }
            return RedirectToAction("Index");
        }
        public ActionResult SelectZone(string layoutId, string pageId, string zoneId)
        {
            LayoutEntity layou = null;
            if (layoutId.IsNotNullAndWhiteSpace())
            {
                layou = Service.Get(layoutId);
            }
            else if (pageId.IsNotNullAndWhiteSpace())
            {
                layou = Service.Get(_pageService.Get(pageId).LayoutId);
            }
            ViewBag.ZoneId = zoneId;
            return View(layou);
        }
    }
}
