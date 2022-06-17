/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Mvc;
using System;
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewTemplate)]
    public class TemplateController : Controller
    {
        private readonly ITemplateService _templateService;
        public TemplateController(ITemplateService templateService)
        {
            _templateService = templateService;
        }

        [DefaultAuthorize(Policy = PermissionKeys.ViewTemplate)]
        public IActionResult Index()
        {
            return View(_templateService.GetAvailableTemplates());
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Create(string template)
        {
            var model = _templateService.GetDefaultTemplateFile(template);
            return View(model);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Create(TemplateFile model)
        {
            if (ModelState.IsValid)
            {
                var result = _templateService.CreateOrUpdate(model);
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
                model = _templateService.Get(fileId);
            }
            else
            {
                model = _templateService.GetDefaultTemplateFile(null);
            }
            return View(model);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageTemplate)]
        public IActionResult Edit(TemplateFile model)
        {
            if (ModelState.IsValid)
            {
                var result = _templateService.CreateOrUpdate(model);
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
            var list = _templateService.GetTemplateFiles(p, themeName, fileName);
            return Json(new TableData(list, list.Count, query.Draw));
        }

        [HttpPost]
        public IActionResult Delete(int id)
        {
            try
            {
                _templateService.Delete(id);
                return Json(new AjaxResult { Status = AjaxStatus.Normal });
            }
            catch (Exception ex)
            {
                return Json(new AjaxResult { Status = AjaxStatus.Error, Message = ex.Message });
            }
        }
    }
}
