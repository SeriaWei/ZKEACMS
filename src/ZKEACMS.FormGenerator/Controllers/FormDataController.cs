/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using ZKEACMS.FormGenerator.Service;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Authorization;
using System.Net;
using Microsoft.AspNetCore.WebUtilities;
using Microsoft.Extensions.Primitives;
using ZKEACMS.Filter;
using Easy;

namespace ZKEACMS.FormGenerator.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewFormData)]
    public class FormDataController : BasicController<FormData, int, IFormDataService>
    {
        private const string ExcelContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        private readonly ILocalize _localize;
        public FormDataController(IFormDataService service, ILocalize localize) : base(service)
        {
            _localize = localize;
        }

        [HttpPost, AllowAnonymous, RenderRefererPage]
        public IActionResult Submit(string FormId)
        {
            var result = Service.SaveForm(Request.Form, FormId);
            ModelState.Merge(result);
            if (!result.HasViolation)
            {
                TempData["Message"] = _localize.Get("Form have submited");
            }
            return View(result.Result.Form);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageFormData)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ExportFormData)]
        public IActionResult Export(int id)
        {
            return File(Service.Export(id), ExcelContentType);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ExportFormData)]
        public IActionResult ExportForm(string id)
        {
            return File(Service.ExportByForm(id), ExcelContentType);
        }
    }
}
