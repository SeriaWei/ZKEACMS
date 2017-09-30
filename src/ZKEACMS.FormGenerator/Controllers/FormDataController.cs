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
    public class FormDataController : BasicController<FormData, int, IFormDataService>
    {
        public FormDataController(IFormDataService service) : base(service)
        {
        }
        [HttpPost]
        public IActionResult Submit(string next, string FormId)
        {
            Service.SaveForm(Request.Form, FormId);
            return Redirect(next);
        }
    }
}
