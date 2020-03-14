/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using ZKEACMS.PackageManger;
using ZKEACMS.SectionWidget.Models;
using ZKEACMS.SectionWidget.Service;
using ZKEACMS.Widget;

namespace ZKEACMS.SectionWidget.Controllers
{
    [DefaultAuthorize]
    public class SectionGroupController : Controller
    {
        private readonly ISectionGroupService _sectionGroupService;
        private readonly ISectionContentProviderService _sectionContentProviderService;
        private readonly IWidgetBasePartService _widgetService;
        private readonly IPackageInstallerProvider _packageInstallerProvider;
        private readonly IWidgetActivator _widgetActivator;
        private readonly ILocalize _localize;
        public SectionGroupController(ISectionGroupService sectionGroupService,
            ISectionContentProviderService sectionContentProviderService,
            IWidgetBasePartService widgetService, IPackageInstallerProvider packageInstallerProvider,
            ILocalize localize,
            IWidgetActivator widgetActivator)
        {
            _sectionGroupService = sectionGroupService;
            _sectionContentProviderService = sectionContentProviderService;
            _widgetService = widgetService;
            _packageInstallerProvider = packageInstallerProvider;
            _widgetActivator = widgetActivator;
            _localize = localize;
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
                GroupName = _localize.Get("Group") + " " + order
            });
        }
        public ActionResult Edit(string Id)
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

        public JsonResult Delete(string Id)
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
                    WidgetPackage package;
                    _packageInstallerProvider.CreateInstaller(Request.Form.Files[0].OpenReadStream(), out package);
                    _widgetActivator.Create(package.Widget).InstallWidget(package);
                }
                catch (Exception ex)
                {
                    return Json(new AjaxResult { Status = AjaxStatus.Error, Message = ex.Message });
                }
            }

            return Json(new AjaxResult { Status = AjaxStatus.Normal, Message = _localize.Get("Upload success") });
        }

        [HttpPost]
        public JsonResult SplitColumn([FromBody]List<SectionGroup> groups)
        {
            if (groups != null)
            {
                groups.Each(g =>
                {
                    if (g.ID.IsNotNullAndWhiteSpace())
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
