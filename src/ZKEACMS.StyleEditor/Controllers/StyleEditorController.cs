using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Controllers;
using Easy.Mvc.Authorize;

namespace ZKEACMS.StyleEditor.Controllers
{
    [DefaultAuthorize]
    public class StyleEditorController : Controller
    {
        public IActionResult Edit()
        {
            return View();
        }
    }
}
