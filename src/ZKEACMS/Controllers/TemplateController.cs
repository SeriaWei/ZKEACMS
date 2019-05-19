using Easy.Mvc;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.RepositoryPattern;
using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;
using ZKEACMS.Common.ViewModels;
using ZKEACMS.Theme;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewTemplate)]
    public class TemplateController : Controller
    {
        private readonly ITemplateService _tempService;
        private readonly IThemeService _themeService;
        public TemplateController(ITemplateService templateService, IThemeService themeService)
        {
            _tempService = templateService;
            _themeService = themeService;
        }

        [DefaultAuthorize(Policy = PermissionKeys.ViewTemplate)]
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Create()
        {
            var theme = _themeService.GetCurrentTheme();
            var model = new TemplateFile()
            {
                ThemeName = theme?.ID,
                LastUpdateTime = DateTime.Now
            };

            return View("Edit", model);
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
                model = _tempService.GetDefaultTemplateFile();
            }
            return View(model);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Edit(TemplateFile model)
        {
            if (ModelState.IsValid)
            {
                string msg = _tempService.CreateOrUpdate(model);
                if (string.IsNullOrEmpty(msg))
                    return RedirectToAction("Index");
                else
                    ModelState.AddModelError("Name", msg);
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
            return Json(new TableData(list, p.RecordCount, query.Draw));
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
