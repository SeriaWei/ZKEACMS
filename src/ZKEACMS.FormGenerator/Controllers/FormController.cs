using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Models;
using ZKEACMS.FormGenerator.Service;
using Easy.Extend;

namespace ZKEACMS.FormGenerator.Controllers
{
    public class FormController : BasicController<Form, string, IFormService>
    {
        public FormController(IFormService service) : base(service)
        {
        }
        [HttpPost]
        public override IActionResult Create([FromBody]Form entity)
        {
            if (ModelState.IsValid)
            {
                Service.Add(entity);
                return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Normal });
            }
            return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Error, Message = ModelState.CombineErrorMessage() });
        }
        [HttpPost]
        public override IActionResult Edit([FromBody]Form entity)
        {
            if (ModelState.IsValid)
            {
                Service.Update(entity);
                return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Normal });
            }
            return Json(new Easy.Mvc.AjaxResult { Status = Easy.Mvc.AjaxStatus.Error, Message = ModelState.CombineErrorMessage() });
        }
    }
}
