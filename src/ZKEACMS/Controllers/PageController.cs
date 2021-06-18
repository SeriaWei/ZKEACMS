/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Extend;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.Mvc.ValueProvider;
using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using System.Net;
using ZKEACMS.Common.ViewModels;
using ZKEACMS.Filter;
using ZKEACMS.Layout;
using ZKEACMS.Page;
using ZKEACMS.Setting;
using ZKEACMS.Widget;
using ZKEACMS.Rule;
using Microsoft.AspNetCore.Mvc.ActionConstraints;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.Controllers
{
    public class PageController : BasicController<PageEntity, string, IPageService>
    {
        public PageController(IPageService service)
            : base(service)
        {
        }

        [Widget]
        public IActionResult Main()
        {
            return View("PreView");
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public override IActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public JsonResult GetPageTree()
        {
            IApplicationSettingService applicationSettingService = HttpContext.RequestServices.GetService<IApplicationSettingService>();
            var expandAll = applicationSettingService.Get(SettingKeys.ExpandAllPage, "true");
            var pages = Service.Get(m => !m.IsPublishedPage).OrderBy(m => m.DisplayOrder);
            var node = new Tree<PageEntity>().Source(pages).ToNode(m => m.ID, m => m.PageName, m => m.ParentId, "#", expandAll.Equals("true", StringComparison.OrdinalIgnoreCase));
            return Json(node);
        }
        [NonAction]
        public override IActionResult Create()
        {
            return base.Create();
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public IActionResult Create(string ParentID = "#")
        {
            var page = new PageEntity
            {
                ParentId = ParentID,
                DisplayOrder = Service.Count(m => m.ParentId == ParentID && !m.IsPublishedPage) + 1,
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
            ViewBag.Page = page;
            return View(page);

        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Create(PageEntity entity)
        {
            ViewBag.Page = entity;
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
        [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Edit(string Id)
        {
            var page = Service.Get(Id);
            if (page == null || page.IsPublishedPage)
            {
                return RedirectToAction("Index");
            }
            ViewBag.OldVersions = Service.Get(m => m.ReferencePageID == page.ID && m.IsPublishedPage == true).OrderBy(m => m.PublishDate);
            ViewBag.Page = page;
            return View(page);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public override IActionResult Edit(PageEntity entity)
        {
            ViewBag.OldVersions = Service.Get(m => m.ReferencePageID == entity.ID && m.IsPublishedPage == true).OrderBy(m => m.PublishDate);
            ViewBag.Page = entity;
            if (!ModelState.IsValid)
            {
                return View(entity);
            }
            try
            {
                ViewBag.Page = entity;
                Service.Update(entity);
            }
            catch (PageExistException ex)
            {
                ModelState.AddModelError("PageUrl", ex.Message);
                return View(entity);
            }
            if (entity.ActionType == ActionType.Design)
            {
                return RedirectToAction("Design", new { entity.ID });
            }
            else if (entity.ActionType == ActionType.Delete)
            {
                Service.Remove(entity);
                return RedirectToAction("Index");
            }
            else if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity);
                return RedirectView(entity.ID, false);
            }
            return RedirectToAction("Index", new { PageID = entity.ID });
        }
        [EditWidget, DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
        public IActionResult Design(string ID)
        {
            ViewBag.CanPasteWidget = HttpContext.RequestServices.GetService<ICookie>().GetValue<string>(Const.CopyWidgetCookie).IsNotNullAndWhiteSpace();
            return View();
        }
        [ViewPage, DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public IActionResult ViewPage(string ID)
        {
            return View("PreView");
        }
        [HttpPost]
        public JsonResult Revert(string ID, bool RetainLatest)
        {
            Service.Revert(ID, RetainLatest);
            return Json(new AjaxResult
            {
                Status = AjaxStatus.Normal
            });

        }
        [HttpPost]
        public JsonResult DeleteVersion(string ID)
        {
            Service.DeleteVersion(ID);
            return Json(new AjaxResult
            {
                Status = AjaxStatus.Normal
            });

        }
        public IActionResult RedirectView(string Id, bool? preview)
        {
            var pathArray = Service.Get(Id).Url.Split('/');
            for (int i = 1; i < pathArray.Length; i++)
            {
                pathArray[i] = WebUtility.UrlEncode(pathArray[i]);
            }
            var url = string.Join("/", pathArray);
            return Redirect(url + ((preview ?? true) ? "?ViewType=" + ReView.Review : ""));
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public IActionResult Select()
        {
            return View();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewPage)]
        public IActionResult PageZones(QueryContext context)
        {
            ILayoutService layoutService = HttpContext.RequestServices.GetService<ILayoutService>();
            IWidgetBasePartService widgetBasePartService = HttpContext.RequestServices.GetService<IWidgetBasePartService>();
            IRuleService ruleService= HttpContext.RequestServices.GetService<IRuleService>();
            var page = Service.Get(context.PageID);
            var layout = layoutService.GetByPage(page);
            var viewModel = new LayoutZonesViewModel
            {
                Page = page,
                Layout = layout,
                PageID = context.PageID,
                LayoutID = layout.ID,
                Zones = layout.Zones,
                Widgets = widgetBasePartService.GetAllByPage(page),
                LayoutHtml = layout.Html
            };
            var rules = ruleService.GetMatchRule(new RuleWorkContext
            {
                Url = Url.Content(page.Url),
                UserAgent = Request.Headers["User-Agent"]
            });
            if (rules.Any())
            {
                var ruleDic = rules.ToDictionary(m => m.RuleID, m => m);
                var rulesID = rules.Select(m => m.RuleID).ToArray();
                var ruleWidgets = widgetBasePartService.GetAllByRule(rulesID);
                ruleWidgets.Each(widget =>
                {
                    var availableZones = layout.Zones.Where(z => ruleDic[widget.RuleID.Value].ZoneNames.Contains(z.ZoneName));
                    foreach (var item in availableZones)
                    {
                        widget.SetZone(item.HeadingCode);
                    }
                });
                viewModel.Widgets = viewModel.Widgets.Concat(ruleWidgets);
            }


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
