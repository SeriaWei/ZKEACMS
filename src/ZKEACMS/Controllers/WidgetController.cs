/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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
using Newtonsoft.Json;
using ZKEACMS.PackageManger;
using ZKEACMS.Page;
using Easy.Modules.DataDictionary;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Hosting;
using Easy.Mvc.Extend;
using Microsoft.Extensions.Options;

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

        public WidgetController(IWidgetBasePartService widgetService, IWidgetTemplateService widgetTemplateService,
            ICookie cookie, IPackageInstallerProvider packageInstallerProvider, IWidgetActivator widgetActivator, IPageService pageService)
        {
            _widgetService = widgetService;
            _widgetTemplateService = widgetTemplateService;
            _cookie = cookie;
            _packageInstallerProvider = packageInstallerProvider;
            _widgetActivator = widgetActivator;
            _pageService = pageService;
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
            var template = _widgetTemplateService.Get(context.WidgetTemplateID);
            var widget = template.ToWidget(HttpContext.RequestServices);
            widget.PageID = context.PageID;
            widget.LayoutID = context.LayoutID;
            widget.ZoneID = context.ZoneID;
            widget.FormView = template.FormView;
            if (widget.PageID.IsNotNullAndWhiteSpace())
            {
                widget.Position = _widgetService.GetAllByPage(_pageService.Get(context.PageID)).Count(m => m.ZoneID == context.ZoneID) + 1;
            }
            else if (context.LayoutID.IsNotNullAndWhiteSpace())
            {
                widget.Position = _widgetService.GetByLayoutId(context.LayoutID).Count(m => m.ZoneID == context.ZoneID) + 1;
            }
            SetDataSource(widget);
            ViewBag.WidgetTemplateName = template.Title;
            ViewBag.ReturnUrl = context.ReturnUrl;
            if (template.FormView.IsNotNullAndWhiteSpace())
            {
                return View(template.FormView, widget);
            }
            return View(widget);
        }
        [HttpPost, ViewDataZones]
        public ActionResult Create(BasicWidget widget, string ReturnUrl)
        {
            if (!ModelState.IsValid)
            {
                return View(widget);
            }
            _widgetActivator.Create(widget).AddWidget(widget);
            if (widget.ActionType == ActionType.Continue)
            {
                return RedirectToAction("Edit", new { widget.ID, ReturnUrl });
            }
            if (!ReturnUrl.IsNullOrEmpty())
            {
                return Redirect(ReturnUrl);
            }
            if (!widget.PageID.IsNullOrEmpty())
            {
                return RedirectToAction("Design", "Page", new { ID = widget.PageID });
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

            var template = _widgetTemplateService.Get(
                m =>
                    m.PartialView == widget.PartialView && m.AssemblyName == widget.AssemblyName &&
                    m.ServiceTypeName == widget.ServiceTypeName && m.ViewModelTypeName == widget.ViewModelTypeName).FirstOrDefault();
            if (template != null)
            {
                ViewBag.WidgetTemplateName = template.Title;
            }
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
            if (!widget.PageID.IsNullOrEmpty())
            {
                return RedirectToAction("Design", "Page", new { ID = widget.PageID });
            }
            return RedirectToAction("LayoutWidget", "Layout");
        }

        [HttpPost]
        public JsonResult SaveWidgetZone([FromBody] List<WidgetBase> widgets)
        {
            foreach (var widget in widgets)
            {
                var w = _widgetService.Get(widget.ID);
                w.ZoneID = widget.ZoneID;
                w.Position = widget.Position;
                _widgetService.Update(w);
            }
            return Json(true);
        }
        [HttpPost]
        public JsonResult DeleteWidget(string ID)
        {
            WidgetBase widget = _widgetService.Get(ID);
            if (widget != null)
            {
                _widgetActivator.Create(widget).DeleteWidget(ID);
                return Json(ID);
            }
            return Json(false);
        }

        public PartialViewResult Templates()
        {
            return PartialView(_widgetService.Get(m => m.IsTemplate == true));
        }

        [HttpPost]
        public IActionResult AppendWidget(WidgetBase widget)
        {
            if (widget == null || widget.PageID.IsNullOrWhiteSpace())
            {
                return NotFound();
            }
            //set design environment
            HttpContext.RequestServices.GetService<IApplicationContextAccessor>().Current.PageMode = Filter.PageViewMode.Design;
            var page = HttpContext.RequestServices.GetService<IPageService>().Get(widget.PageID);
            WidgetViewModelPart widgetPart = null;
            if (page != null)
            {
                var layout = HttpContext.RequestServices.GetService<Layout.ILayoutService>().Get(page.LayoutId);
                layout.Page = page;
                ControllerContext.HttpContext.TrySetLayout(layout);

                widgetPart = _widgetService.ApplyTemplate(widget, ControllerContext);
            }
            if (widgetPart == null)
            {
                widgetPart = new HtmlWidget { PartialView = "Widget.HTML", HTML = "<h1 class='text-danger'><hr/>Error<hr/></h1>" }.ToWidgetViewModelPart();
            }
            return PartialView("AppendWidget", new DesignWidgetViewModel(widgetPart, widget.PageID));
        }
        [HttpPost]
        public JsonResult CancelTemplate(string Id)
        {
            var widget = _widgetService.Get(Id);
            if (!widget.IsSystem)
            {
                widget.IsTemplate = false;
                if (widget.PageID.IsNotNullAndWhiteSpace() || widget.LayoutID.IsNotNullAndWhiteSpace())
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
            var widgetPackage = _widgetActivator.Create(widget).PackWidget(widget) as WidgetPackage;
            return File(widgetPackage.ToFilePackage(), "Application/zip", widgetPackage.Widget.WidgetName + ".widget");
        }
        public FileResult PackDictionary(int ID, string[] filePath)
        {
            var dataDictionaryService = HttpContext.RequestServices.GetService<IDataDictionaryService>();
            var dataDictionary = dataDictionaryService.Get(ID);
            var installer = new DataDictionaryPackageInstaller(HttpContext.RequestServices.GetService<IWebHostEnvironment>(), dataDictionaryService);
            if (filePath != null && filePath.Any())
            {
                installer.OnPacking = () =>
                {
                    List<System.IO.FileInfo> files = new List<System.IO.FileInfo>();
                    foreach (var item in filePath)
                    {
                        files.Add(new System.IO.FileInfo(Request.MapPath(item)));
                    }
                    return files;
                };
            }

            return File(installer.Pack(dataDictionary).ToFilePackage(), "Application/zip", dataDictionary.Title + ".widget");
        }
        [HttpPost]
        public ActionResult InstallWidgetTemplate(string returnUrl)
        {
            if (Request.Form.Files.Count > 0)
            {

                Package package;
                var installer = _packageInstallerProvider.CreateInstaller(Request.Form.Files[0].OpenReadStream(), out package);
                if (installer is WidgetPackageInstaller)
                {
                    var widgetPackage = JsonConvert.DeserializeObject<WidgetPackage>(package.Content.ToString());
                    widgetPackage.Content = package.Content;
                    _widgetActivator.Create(widgetPackage.Widget).InstallWidget(widgetPackage);
                }
                else
                {
                    installer.Install(package.Content.ToString());
                }

            }
            return Redirect(returnUrl);
        }
        [HttpPost]
        public JsonResult Copy(string widgetId)
        {
            _cookie.SetValue(Const.CopyWidgetCookie, widgetId, true, true);
            return Json(new AjaxResult { Status = AjaxStatus.Normal, Message = "复制成功，请到需要的页面区域粘贴！" });
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
            var widgetPart = _widgetService.ApplyTemplate(widget, ControllerContext);
            if (widgetPart != null)
            {
                if (ReturnUrl.IsNotNullAndWhiteSpace())
                {
                    return Redirect(ReturnUrl);
                }
                return RedirectToAction("Edit", new { widgetPart.Widget.ID, ReturnUrl });
            }
            _cookie.GetValue<string>(Const.CopyWidgetCookie, true);
            return RedirectToAction("SelectWidget", "WidgetTemplate", new { widget.PageID, widget.ZoneID, widget.LayoutID, ReturnUrl });
        }
    }
}
