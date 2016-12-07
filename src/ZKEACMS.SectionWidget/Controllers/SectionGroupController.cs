/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.SectionWidget.Models;
using ZKEACMS.SectionWidget.Service;
using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc;
using ZKEACMS.Widget;
using Easy;

namespace ZKEACMS.SectionWidget.Controllers
{
    [DefaultAuthorize]
    public class SectionGroupController : Controller
    {
        private readonly ISectionGroupService _sectionGroupService;
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly IWidgetBasePartService _widgetService;
        public SectionGroupController(ISectionGroupService sectionGroupService,
            ISectionContentProviderService sectionContentProviderService,
            IWidgetBasePartService widgetService)
        {
            _sectionGroupService = sectionGroupService;
            _sectionContentProviderService = sectionContentProviderService;
            _widgetService = widgetService;
        }

        public ActionResult Create(string sectionWidgetId)
        {
            var order = _sectionGroupService.Count(m => m.SectionWidgetId == sectionWidgetId) + 1;
            return View("Form", new SectionGroup
            {
                SectionWidgetId = sectionWidgetId,
                ActionType = ActionType.Create,
                Order = order,
                PartialView = "SectionTemplate.Default",
                GroupName = "组 " + order
            });
        }
        public ActionResult Edit(int Id)
        {
            var group = _sectionGroupService.Get(Id);
            group.ActionType = ActionType.Update;
            return View("Form", group);
        }
        [HttpPost]
        public ActionResult Save(SectionGroup group)
        {
            if (!ModelState.IsValid)
            {
                return View("Form", group);
            }
            if (group.ActionType == ActionType.Create)
            {
                _sectionGroupService.Add(group);
            }
            else
            {
                _sectionGroupService.Update(group);
            }
            ViewBag.Close = true;
            return View("Form", group);
        }

        public JsonResult Delete(int Id)
        {
            _sectionGroupService.Remove(Id);
            return Json(true);
        }
        [HttpPost]
        public JsonResult Sort(List<SectionGroup> groups)
        {
            groups.Each(m =>
            {
                var g = _sectionGroupService.Get(m.ID);
                g.Order = m.Order;
                _sectionGroupService.Update(g);
            });
            return Json(true);
        }

        [HttpPost]
        public JsonResult SortContent(List<SectionContent> contents)
        {
            contents.Each(m =>
            {
                _sectionContentProviderService.SaveSort(m);
            });
            return Json(true);
        }
        [HttpPost]
        public JsonResult UploadTemplate()
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
                    return Json(new AjaxResult { Status = AjaxStatus.Error, Message = "上传的模板不正确" });
                }
            }

            return Json(new AjaxResult { Status = AjaxStatus.Normal, Message = "上传成功" });
        }

        [HttpPost]
        public JsonResult SplitColumn(List<SectionGroup> groups)
        {
            if (groups != null)
            {
                groups.Each(g =>
                {
                    if (g.ID > 0)
                    {
                        var group = _sectionGroupService.Get(g.ID);
                        if (group != null)
                        {
                            group.PercentWidth = g.PercentWidth;
                        }
                        _sectionGroupService.Update(group);
                    }
                    else
                    {
                        _sectionGroupService.Add(g);
                    }
                });
            }
            return Json(new { Groups = groups.Count });
        }
    }
}
