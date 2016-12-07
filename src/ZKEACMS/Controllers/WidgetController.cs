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

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ManagePage)]
    public class WidgetController : Controller
    {
        private readonly IWidgetBasePartService _widgetService;
        private readonly IWidgetTemplateService _widgetTemplateService;
        private readonly ICookie _cookie;

        public WidgetController(IWidgetBasePartService widgetService, IWidgetTemplateService widgetTemplateService, ICookie cookie)
        {
            _widgetService = widgetService;
            _widgetTemplateService = widgetTemplateService;
            _cookie = cookie;
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
                widget.Position = _widgetService.GetAllByPageId(HttpContext.RequestServices, context.PageID).Count(m => m.ZoneID == context.ZoneID) + 1;
            }
            else
            {
                widget.Position = _widgetService.GetByLayoutId(context.LayoutID).Count(m => m.ZoneID == context.ZoneID) + 1;
            }
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
            widget.CreateServiceInstance(HttpContext.RequestServices).AddWidget(widget);
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
            var widget = widgetBase.CreateServiceInstance(HttpContext.RequestServices).GetWidget(widgetBase);
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
            widget.CreateServiceInstance(HttpContext.RequestServices).UpdateWidget(widget);
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
                widget.CreateServiceInstance(HttpContext.RequestServices).DeleteWidget(ID);
                return Json(ID);
            }
            return Json(false);
        }

        public PartialViewResult Templates()
        {
            return PartialView(_widgetService.Get(m => m.IsTemplate == true));
        }

        [HttpPost]
        public PartialViewResult AppendWidget(WidgetBase widget)
        {
            var widgetPart = _widgetService.ApplyTemplate(widget, HttpContext);
            if (widgetPart == null)
            {
                widgetPart = new HtmlWidget { PartialView = "Widget.HTML", HTML = "<h1 class='text-danger'><hr/>操作失败，找不到数据源，刷新页面后该消息会消失。<hr/></h1>" }.ToWidgetViewModelPart();
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
                    widget.CreateServiceInstance(HttpContext.RequestServices).DeleteWidget(Id);
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
            var file = _widgetService.PackWidget(ID, HttpContext);
            return File(file, "Application/zip", widget.WidgetName + ".zip");
        }
        [HttpPost]
        public ActionResult InstallWidgetTemplate(string returnUrl)
        {
            if (Request.Form.Files.Count > 0)
            {
                try
                {
                    _widgetService.InstallPackWidget(Request.Form.Files[0].OpenReadStream(), HttpContext);
                }
                catch (Exception ex)
                {
                    Logger.Error(ex);
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
        public PartialViewResult Paste(WidgetBase widget)
        {
            widget.ID = _cookie.GetValue<string>(Const.CopyWidgetCookie);
            return AppendWidget(widget);
        }

        public ActionResult PasteAndRedirect(WidgetBase widget, string ReturnUrl)
        {
            widget.ID = _cookie.GetValue<string>(Const.CopyWidgetCookie);
            var widgetPart = _widgetService.ApplyTemplate(widget, HttpContext);
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
