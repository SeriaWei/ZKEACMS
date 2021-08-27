/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Controllers
{
    public class AntiforgeryController : Controller
    {
        private readonly IAntiforgery _antiforgery;

        public AntiforgeryController(IAntiforgery antiforgery)
        {
            _antiforgery = antiforgery;
        }
        public IActionResult GetTokenSet()
        {
            var tokenSet = _antiforgery.GetAndStoreTokens(HttpContext);
            string content = $"/*! http://www.zkea.net/ Copyright (c) ZKEASOFT. All rights reserved. http://www.zkea.net/licenses */ var ZKEACMS = ZKEACMS || {{}}; ZKEACMS.AntiToken = {{ '{tokenSet.FormFieldName}': '{tokenSet.RequestToken}' }};";
            return Content(content, "application/javascript");
        }
    }
}
