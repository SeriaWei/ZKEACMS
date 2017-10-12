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

namespace ZKEACMS.FormGenerator.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewFormData)]
    public class FormDataController : BasicController<FormData, int, IFormDataService>
    {
        private const string ExcelContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        public FormDataController(IFormDataService service) : base(service)
        {
        }
        [HttpPost, AllowAnonymous]
        public IActionResult Submit(string next, string FormId)
        {
            Service.SaveForm(Request.Form, FormId);
            return Redirect(next);
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
