/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Linq;
using ZKEACMS.Common.ViewModels;
using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Controllers;
using ZKEACMS.Page;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Filter;
using Easy.Mvc.Attribute;
using ZKEACMS.Layout;
using Easy;
using Easy.Mvc.ValueProvider;
using ZKEACMS.Zone;
using ZKEACMS.Widget;
using System;
using Microsoft.AspNetCore.Http;
using Easy.ViewPort.jsTree;
using Microsoft.Extensions.DependencyInjection;
using Easy.Mvc.Authorize;

namespace ZKEACMS.Controllers
{
    public class PageController : BasicController<PageEntity, string, IPageService>
    {
        private readonly ICookie _cookie;
        private readonly IZoneService _zoneService;
        private readonly ILayoutService _layoutService;
        private readonly IWidgetService _widgetService;
        public PageController(IPageService service,
            ICookie cookie,
            IZoneService zoneService,
            ILayoutService layoutService,
            IWidgetService widgetService)
            : base(service)
        {
            _cookie = cookie;
            _zoneService = zoneService;
            _layoutService = layoutService;
            _widgetService = widgetService;
        }
        [Widget]
        public ActionResult PreView()
        {
            return View();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public override ActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public JsonResult GetPageTree()
        {
            var pages = Service.Get(m => !m.IsPublishedPage).OrderBy(m => m.DisplayOrder);
            var node = new Tree<PageEntity>().Source(pages).ToNode(m => m.ID, m => m.PageName, m => m.ParentId, "#");
            return Json(node);
        }
        [NonAction]
        public override ActionResult Create()
        {
            return base.Create();
        }

        [ViewDataLayouts, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public ActionResult Create(string ParentID)
        {
            var page = new PageEntity
            {
                ParentId = ParentID,
                DisplayOrder = Service.Count(m => m.ParentId == ParentID) + 1,
                Url = "~/"
            };
            var parentPage = Service.Get(ParentID);
            if (parentPage != null)
            {
                page.Url = parentPage.Url;
            }
            if (!page.Url.EndsWith("/"))
            {
                page.Url += "/";
            }
            return View(page);

        }
        [ViewDataLayouts, HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override ActionResult Create(PageEntity entity)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    Service.Add(entity);
                }
                catch (PageExistException ex)
                {
                    ModelState.AddModelError("PageUrl", ex.Message);
                    return View(entity);
                }
                return RedirectToAction("Design", new { entity.ID });
            }
            return View(entity);
        }
        [ViewDataLayouts, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override ActionResult Edit(string Id)
        {
            return base.Edit(Id);
        }
        [ViewDataLayouts, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        [HttpPost]
        public override ActionResult Edit(PageEntity entity)
        {
            if (entity.ActionType == ActionType.Design)
            {
                return RedirectToAction("Design", new { entity.ID });
            }
            string id = entity.ID;
            if (entity.ActionType == ActionType.Delete)
            {
                Service.Remove(id);
                return RedirectToAction("Index");
            }
            try
            {
                Service.Update(entity);
            }
            catch (PageExistException ex)
            {
                ModelState.AddModelError("PageUrl", ex.Message);
                return View(entity);
            }
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity);
            }
            return RedirectToAction("Index", new { PageID = id });
        }
        [EditWidget, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public ActionResult Design(string ID)
        {
            // Stop Caching in IE


            // Stop Caching in Firefox

            ViewBag.CanPasteWidget = _cookie.GetValue<string>(Const.CopyWidgetCookie).IsNotNullAndWhiteSpace();
            return View();
        }

        public ActionResult RedirectView(string Id, bool? preview)
        {
            return Redirect(Service.Get(Id).Url + ((preview ?? true) ? "?ViewType=" + ReView.Review : ""));
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public ActionResult Select()
        {
            return View();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public ActionResult PageZones(QueryContext context)
        {
            var page = Service.Get(context.PageID);
            var layout = _layoutService.Get(page.LayoutId);
            var viewModel = new LayoutZonesViewModel
            {
                Page = page,
                Layout = layout,
                PageID = context.PageID,
                LayoutID = layout.ID,
                Zones = _zoneService.GetZonesByPageId(context.PageID),
                Widgets = _widgetService.GetAllByPageId(HttpContext.RequestServices, context.PageID),
                LayoutHtml = layout.Html
            };
            return View(viewModel);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public JsonResult MovePage(string id, int position, int oldPosition)
        {
            Service.Move(id, position, oldPosition);
            return Json(true);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public JsonResult Publish(string id)
        {
            Service.Publish(Service.Get(id));
            return Json(true);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public RedirectResult PublishPage(string ID, string ReturnUrl)
        {
            Service.Publish(Service.Get(ID));
            return Redirect(ReturnUrl);
        }
    }
}
