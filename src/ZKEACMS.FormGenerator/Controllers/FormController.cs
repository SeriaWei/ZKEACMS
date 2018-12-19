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
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.FormGenerator.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewForm)]
    public class FormController : BasicController<Form, string, IFormService>
    {
        public FormController(IFormService service) : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageForm)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageForm)]
        public override IActionResult Create([FromBody]Form entity)
        {
            if (ModelState.IsValid)
            {
                Service.Add(entity);
                return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Normal });
            }
            return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Error, Message = ModelState.CombineErrorMessage() });
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageForm)]
        public override IActionResult Edit([FromBody]Form entity)
        {
            if (ModelState.IsValid)
            {
                Service.Update(entity);
                return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Normal });
            }
            return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Error, Message = ModelState.CombineErrorMessage() });
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageForm)]
        public override IActionResult Delete(string id)
        {
            var formDataService = HttpContext.RequestServices.GetService<IFormDataService>();
            formDataService.Get(m => m.FormId == id).Each(data =>
            {
                formDataService.Remove(data);
            });
            return base.Delete(id);
        }
    }
}
