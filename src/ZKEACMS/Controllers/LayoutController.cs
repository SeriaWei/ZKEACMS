/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

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
    [DefaultAuthorize(Policy = PermissionKeys.ViewLayout)]
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


        public override IActionResult Index()
        {
            return View(Service.GetWithFull());
        }

        public IActionResult LayoutWidget(string LayoutID)
        {
            ViewBag.LayoutID = LayoutID;
            return View(Service.Get());
        }
        [HttpPost]
        public IActionResult LayoutZones(string ID)
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

        public override IActionResult Create()
        {
            return View(new LayoutEntity { ImageUrl = LayoutEntity.DefaultThumbnial, ImageThumbUrl = LayoutEntity.DefaultThumbnial });
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageLayout)]
        public override IActionResult Create(LayoutEntity entity)
        {
            base.Create(entity);
            return RedirectToAction("Design", new { entity.ID });
        }

        public override IActionResult Edit(string ID)
        {
            return base.Edit(ID);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageLayout)]
        public override IActionResult Edit(LayoutEntity entity)
        {
            if (entity.ActionType == ActionType.Design)
            {
                return RedirectToAction("Design", new { entity.ID });
            }
            return base.Edit(entity);
        }
        [ResponseCache(NoStore = true)]
        public IActionResult Design(string ID, string PageID)
        {
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
        [DefaultAuthorize(Policy = PermissionKeys.ManageLayout)]
        public IActionResult SaveLayout(string[] html, LayoutEntity layout, ZoneCollection zones)
        {
            layout.Html = Zone.Helper.GenerateHtml(html, zones);
            layout.Zones = zones;
            Service.UpdateDesign(layout);
            if (layout.Page != null)
            {
                return RedirectToAction("Design", "Page", new { layout.Page.ID });
            }
            return RedirectToAction("Index");
        }
        public IActionResult SelectZone(string layoutId, string pageId, string zoneId)
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
