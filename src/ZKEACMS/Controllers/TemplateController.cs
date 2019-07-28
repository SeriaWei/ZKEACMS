using Easy.Mvc;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.RepositoryPattern;
using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;
using ZKEACMS.Common.ViewModels;
using ZKEACMS.Theme;
using ZKEACMS.Widget;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewTemplate)]
    public class TemplateController : Controller
    {
        private readonly ITemplateService _tempService;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly IWidgetTemplateService _widgetTemplateService;
        public TemplateController(ITemplateService templateService, IWebHostEnvironment webHostEnvironment,
            IWidgetTemplateService widgetTemplateService)
        {
            _tempService = templateService;
            _webHostEnvironment = webHostEnvironment;
            _widgetTemplateService = widgetTemplateService;
        }

        [DefaultAuthorize(Policy = PermissionKeys.ViewTemplate)]
        public IActionResult Index()
        {
            return View(_widgetTemplateService.Get());
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Create(string template)
        {
            var model = _tempService.GetDefaultTemplateFile(template);
            return View(model);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Create(TemplateFile model)
        {
            if (ModelState.IsValid)
            {
                var result = _tempService.CreateOrUpdate(model);
                if (result.HasViolation)
                {
                    ModelState.AddModelError("Name", result.ErrorMessage);
                    return View(model);
                }
                else
                {
                    return RedirectToAction("Edit", new { id = result.Result.Id });
                }

            }
            return View(model);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Edit(int? id)
        {
            int fileId = id ?? 0;
            TemplateFile model = null;
            if (fileId > 0)
            {
                model = _tempService.Get(fileId);
            }
            else
            {
                model = _tempService.GetDefaultTemplateFile(null);
            }
            return View(model);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Edit(TemplateFile model)
        {
            if (ModelState.IsValid)
            {
                var result = _tempService.CreateOrUpdate(model);
                if (result.HasViolation)
                {
                    ModelState.AddModelError("Name", result.ErrorMessage);
                    return View(model);
                }
                else
                {
                    return RedirectToAction("Edit", new { id = result.Result.Id });
                }

            }
            return View(model);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ViewTemplate)]
        public IActionResult GetList(DataTableOption query)
        {
            var p = new Pagination() { PageIndex = query.Start, PageSize = query.Length };
            string themeName = string.Empty;
            string fileName = string.Empty;
            if (query.Columns != null)
            {
                if (query.Columns.Length > 1) themeName = query.Columns[1].Search.Value;
                if (query.Columns.Length > 2) fileName = query.Columns[2].Search.Value;
            }
            var list = _tempService.GetTemplateFiles(p, themeName, fileName);
            return Json(new TableData(list, list.Count, query.Draw));
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            try
            {
                _tempService.Delete(id);
                return Json(new AjaxResult { Status = AjaxStatus.Normal });
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Status = AjaxStatus.Error, Message = ex.Message });
            }
        }
    }
}
