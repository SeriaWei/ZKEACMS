/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Widget;
using ZKEACMS.WidgetTemplate;
using Easy.Mvc.ValueProvider;
using Easy;
using Easy.Mvc;
using ZKEACMS.Common.Models;
using System.IO;
using ZKEACMS.PackageManger;
using ZKEACMS.Page;
using Easy.Modules.DataDictionary;
using Easy.Serializer;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Easy.Mvc.Extend;
using Microsoft.Extensions.Options;
using ZKEACMS.Zone;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
    public class WidgetController : Controller
    {
        private readonly IWidgetBasePartService _widgetService;
        private readonly IWidgetTemplateService _widgetTemplateService;
        private readonly ICookie _cookie;
        private readonly IPackageInstallerProvider _packageInstallerProvider;
        private readonly IWidgetActivator _widgetActivator;
        private readonly IPageService _pageService;
        private readonly ILocalize _localize;
        private readonly IZoneService _zoneService;

        public WidgetController(IWidgetBasePartService widgetService,
            IWidgetTemplateService widgetTemplateService,
            ICookie cookie,
            IPackageInstallerProvider packageInstallerProvider,
            IWidgetActivator widgetActivator,
            IPageService pageService,
            ILocalize localize,
            IZoneService zoneService)
        {
            _widgetService = widgetService;
            _widgetTemplateService = widgetTemplateService;
            _cookie = cookie;
            _packageInstallerProvider = packageInstallerProvider;
            _widgetActivator = widgetActivator;
            _pageService = pageService;
            _localize = localize;
            _zoneService = zoneService;
        }
        private void SetDataSource(WidgetBase widget)
        {
            var dataSourceSetting = HttpContext.RequestServices.GetService(typeof(IOptions<>).MakeGenericType(widget.GetType())) as IOptions<WidgetBase>;
            if (dataSourceSetting != null)
            {
                widget.DataSourceLink = dataSourceSetting.Value.DataSourceLink;
                widget.DataSourceLinkTitle = dataSourceSetting.Value.DataSourceLinkTitle;
            }
            else
            {
                widget.DataSourceLink = string.Empty;
                widget.DataSourceLinkTitle = string.Empty;
            }
        }
        [ViewDataZones]
        public ActionResult Create(QueryContext context)
        {
            ViewBag.ReturnUrl = context.ReturnUrl;
            if (context.WidgetTemplateID.IsNotNullAndWhiteSpace())
            {
                return CreateWidgetFromTemplate(context);
            }
            else if (context.WidgetID.IsNotNullAndWhiteSpace())
            {
                return CreateWidgetFromExistingWidget(context);
            }
            return BadRequest();
        }

        private ActionResult CreateWidgetFromExistingWidget(QueryContext context)
        {
            var widgetBasePart = _widgetService.Get(context.WidgetID);
            IWidgetPartDriver widgetPartDriver = _widgetActivator.Create(widgetBasePart);
            WidgetBase widget = widgetPartDriver.GetWidget(widgetBasePart.ToWidgetBase());
            if (widget == null) return BadRequest();

            widget.IsTemplate = false;
            widget.IsSystem = false;
            widget.Thumbnail = null;
            widget.RuleID = null;
            SetDefaultValuesToWidget(context, widget);
            widgetPartDriver.AddWidget(widget);
            return RedirectToAction("Edit", new { ID = widget.ID, ReturnUrl = context.ReturnUrl });
        }

        private ActionResult CreateWidgetFromTemplate(QueryContext context)
        {
            var template = _widgetTemplateService.Get(context.WidgetTemplateID);
            WidgetBase widget = template.ToWidget(HttpContext.RequestServices);
            if (widget == null) return BadRequest();

            SetDefaultValuesToWidget(context, widget);
            if (widget.FormView.IsNotNullAndWhiteSpace())
                return View(widget.FormView, widget);

            return View(widget);
        }

        private void SetDefaultValuesToWidget(QueryContext context, WidgetBase widget)
        {
            widget.PageId = context.PageId;
            widget.LayoutId = context.LayoutId;
            widget.ZoneId = context.ZoneId;
            widget.RuleID = context.RuleID;
            if (widget.PageId.IsNotNullAndWhiteSpace())
            {
                widget.Position = _widgetService.GetAllByPage(_pageService.Get(context.PageId)).Count(m => m.ZoneId == context.ZoneId) + 1;
            }
            else if (context.LayoutId.IsNotNullAndWhiteSpace())
            {
                widget.Position = _widgetService.GetByLayoutId(context.LayoutId).Count(m => m.ZoneId == context.ZoneId) + 1;
            }
            if (widget.ZoneId.IsNullOrEmpty())
            {
                ZoneEntity firstZone = null;
                if (widget.PageId.IsNotNullAndWhiteSpace())
                {
                    firstZone = _zoneService.GetByPage(_pageService.Get(widget.PageId)).FirstOrDefault();
                }
                else if (widget.LayoutId.IsNotNullAndWhiteSpace())
                {
                    firstZone = _zoneService.GetByLayoutId(widget.LayoutId).FirstOrDefault();
                }
                if (firstZone != null)
                {
                    widget.ZoneId = firstZone.HeadingCode;
                }
            }
            SetDataSource(widget);
        }

        [HttpPost, ViewDataZones]
        public ActionResult Create(BasicWidget widget, string ReturnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(widget);
            }
            _widgetActivator.Create(widget).AddWidget(widget);
            if (widget.ActionType.HasFlag(ActionType.Continue))
            {
                return RedirectToAction("Edit", new { widget.ID, ReturnUrl });
            }
            if (!ReturnUrl.IsNullOrEmpty())
            {
                return Redirect(ReturnUrl);
            }
            if (!widget.PageId.IsNullOrEmpty())
            {
                return RedirectToAction("Design", "Page", new { ID = widget.PageId });
            }
            return RedirectToAction("LayoutWidget", "Layout");
        }
        [ViewDataZones]
        public ActionResult Edit(string ID, string ReturnUrl)
        {
            var widgetBase = _widgetService.Get(ID);
            var widget = _widgetActivator.Create(widgetBase).GetWidget(widgetBase);
            SetDataSource(widget);
            ViewBag.ReturnUrl = ReturnUrl;

            if (widget.FormView.IsNotNullAndWhiteSpace())
            {
                return View(widget.FormView, widget);
            }
            return View(widget);
        }

        [HttpPost, ViewDataZones]
        public ActionResult Edit(BasicWidget widget, string ReturnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(widget);
            }
            _widgetActivator.Create(widget).UpdateWidget(widget);
            if (!ReturnUrl.IsNullOrEmpty())
            {
                return Redirect(ReturnUrl);
            }
            if (!widget.PageId.IsNullOrEmpty())
            {
                return RedirectToAction("Design", "Page", new { ID = widget.PageId });
            }
            return RedirectToAction("LayoutWidget", "Layout");
        }

        [HttpPost]
        public JsonResult SaveWidgetZone([FromBody] List<WidgetBase> widgets)
        {
            foreach (var widget in widgets)
            {
                var w = _widgetService.Get(widget.ID);
                w.ZoneId = widget.ZoneId;
                w.Position = widget.Position;
                _widgetService.Update(w);
            }
            return Json(true);
        }
        [HttpPost]
        public JsonResult DeleteWidget(string ID, bool? permanent)
        {
            var widget = _widgetService.Get(ID);
            if (widget == null) return Json(new { ActionType = (int)ActionType.UnAttach });

            if (widget.Status == (int)WidgetStatus.Deleted || permanent == true)
            {
                _widgetActivator.Create(widget).DeleteWidget(ID);
                return Json(new { ActionType = (int)ActionType.Delete });
            }
            else
            {
                widget.Status = (int)WidgetStatus.Deleted;
                _widgetService.Update(widget);
                return Json(new { ActionType = (int)ActionType.Update });
            }
        }

        public PartialViewResult Templates()
        {
            return PartialView(_widgetService.Get(m => m.IsTemplate == true));
        }

        [HttpPost]
        public IActionResult AppendWidget(WidgetBase widget)
        {
            if (widget == null || widget.PageId.IsNullOrWhiteSpace())
            {
                return NotFound();
            }
            //set design environment
            HttpContext.RequestServices.GetService<IApplicationContextAccessor>().Current.PageMode = Filter.PageViewMode.Design;
            var page = HttpContext.RequestServices.GetService<IPageService>().Get(widget.PageId);
            WidgetViewModelPart widgetPart = null;
            if (page != null)
            {
                var layout = HttpContext.RequestServices.GetService<Layout.ILayoutService>().GetByPage(page);
                layout.Page = page;
                widgetPart = _widgetService.ApplyTemplate(layout, widget, ControllerContext);
            }
            if (widgetPart == null)
            {
                HtmlWidget errorWidget = new HtmlWidget { PartialView = "Widget.HTML", HTML = "<h1 class='text-danger'><hr/>Error<hr/></h1>" };
                widgetPart = new WidgetViewModelPart(errorWidget, errorWidget);
            }
            return PartialView("AppendWidget", new DesignWidgetViewModel(widgetPart, widget.PageId));
        }
        [HttpPost]
        public JsonResult CancelTemplate(string Id)
        {
            var widget = _widgetService.Get(Id);
            if (widget is null) return Json(Id);

            if (!widget.IsSystem)
            {
                widget.IsTemplate = false;
                if (widget.PageId.IsNotNullAndWhiteSpace() || widget.LayoutId.IsNotNullAndWhiteSpace())
                {
                    _widgetService.Update(widget);
                }
                else
                {
                    _widgetActivator.Create(widget).DeleteWidget(Id);
                }
            }
            return Json(Id);
        }
        [HttpPost]
        public JsonResult ToggleClass(string ID, string clas)
        {
            var widget = _widgetService.Get(ID);
            if (widget != null)
            {
                if (widget.StyleClass.IsNotNullAndWhiteSpace() && widget.StyleClass.IndexOf(clas) >= 0)
                {
                    widget.StyleClass = widget.StyleClass.Replace(clas, "").Trim();
                }
                else
                {
                    widget.StyleClass = clas + " " + (widget.StyleClass ?? "");
                    widget.StyleClass = widget.StyleClass.Trim();
                }
                _widgetService.Update(widget);
            }
            return Json(ID);
        }
        [HttpPost]
        public JsonResult SaveCustomStyle(string ID, string style)
        {
            var widget = _widgetService.Get(ID);
            if (widget != null)
            {
                if (style.IsNotNullAndWhiteSpace())
                {
                    widget.StyleClass = widget.CustomClass.Trim() + " style=\"{0}\"".FormatWith(style);
                    widget.StyleClass = widget.StyleClass.Trim();
                }
                else
                {
                    widget.StyleClass = widget.CustomClass;
                }
                _widgetService.Update(widget);
            }
            return Json(ID);
        }
        public FileResult Pack(string ID)
        {
            var widget = _widgetService.Get(ID);
            var widgetPackage = _packageInstallerProvider.CreateInstaller(WidgetPackageInstaller.InstallerName).Pack(widget) as WidgetPackage;
            return PackageResult(widgetPackage, widgetPackage.Widget.WidgetName);
        }
        public FileResult PackDictionary(int ID, string[] filePath)
        {
            var dataDictionaryService = HttpContext.RequestServices.GetService<IDataDictionaryService>();
            var dataDictionary = dataDictionaryService.Get(ID);
            var installer = _packageInstallerProvider.CreateInstaller(DataDictionaryPackageInstaller.InstallerName) as DataDictionaryPackageInstaller;
            if (filePath != null)
            {
                foreach (var item in filePath)
                {
                    installer.IncludeFile(item);
                }
            }

            return PackageResult(installer.Pack(dataDictionary), dataDictionary.Title);
        }
        private FileContentResult PackageResult(Package package, string name)
        {
            return File(package.ToFilePackage(), "Application/zip", $"{name}.wgt");
        }
        [HttpPost]
        public ActionResult InstallWidgetTemplate(string returnUrl)
        {
            if (Request.Form.Files.Count > 0)
            {
                using (Stream stream = Request.Form.Files[0].OpenReadStream())
                {
                    Package package;
                    var installer = _packageInstallerProvider.CreateInstaller(stream, out package);
                    installer.Install(package);
                }
            }
            return Redirect(returnUrl);
        }
        [HttpPost]
        public JsonResult Copy(string widgetId)
        {
            _cookie.SetValue(Const.CopyWidgetCookie, widgetId, true, true);
            return Json(new AjaxResult { Status = AjaxStatus.Normal, Message = _localize.Get("Copy success") });
        }

        [HttpPost]
        public IActionResult Paste(WidgetBase widget)
        {
            widget.ID = _cookie.GetValue<string>(Const.CopyWidgetCookie);
            return AppendWidget(widget);
        }

        public ActionResult PasteAndRedirect(WidgetBase widget, string ReturnUrl)
        {
            widget.ID = _cookie.GetValue<string>(Const.CopyWidgetCookie);
            var page = HttpContext.RequestServices.GetService<IPageService>().Get(widget.PageId);
            var layout = HttpContext.RequestServices.GetService<Layout.ILayoutService>().GetByPage(page);
            layout.Page = page;
            var widgetPart = _widgetService.ApplyTemplate(layout, widget, ControllerContext);
            if (widgetPart != null)
            {
                if (ReturnUrl.IsNotNullAndWhiteSpace())
                {
                    return Redirect(ReturnUrl);
                }
                return RedirectToAction("Edit", new { widgetPart.Widget.ID, ReturnUrl });
            }
            _cookie.GetValue<string>(Const.CopyWidgetCookie, true);
            return RedirectToAction("SelectWidget", "WidgetTemplate", new { widget.PageId, widget.ZoneId, widget.LayoutId, ReturnUrl });
        }

        public IActionResult PlayVideo(string url)
        {
            return View("PlayVideo", url);
        }
    }
}
