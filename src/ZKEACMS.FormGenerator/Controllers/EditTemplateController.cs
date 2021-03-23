/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.FormGenerator.Controllers
{
    [DefaultAuthorize]
    public class EditTemplateController : Controller
    {
        public IActionResult TemplateView(string template)
        {
            return PartialView(template);
        }
    }
}
