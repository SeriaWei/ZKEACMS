﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
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
    public class PreviewTemplateController : Controller
    {
        public IActionResult TemplateView(string template)
        {
            return PartialView(template);
        }
    }
}
