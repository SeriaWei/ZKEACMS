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
            try
            {
                var tokenSet = _antiforgery.GetAndStoreTokens(HttpContext);
                string content = $"/*! http://www.zkea.net/ Copyright (c) ZKEASOFT. All rights reserved. http://www.zkea.net/licenses */ var ZKEACMS = ZKEACMS || {{}}; ZKEACMS.AntiToken = {{ '{tokenSet.FormFieldName}': '{tokenSet.RequestToken}' }};";
                return Content(content, "application/javascript");
            }
            catch
            {
                string content = "/*! http://www.zkea.net/ Copyright (c) ZKEASOFT. All rights reserved. http://www.zkea.net/licenses */ var ZKEACMS = ZKEACMS || {}; ZKEACMS.AntiToken = {};fetch('"+ Url.Action("GetRequestToken") +"', { method: 'POST', cache: 'no-cache',headers: { 'Content-Type': 'application/json'} }).then(function (data) { return data.json() }).then(function (data) { ZKEACMS.AntiToken[data.key]=data.value; });";
                return Content(content, "application/javascript");
            }
        }

        [HttpPost]
        public IActionResult GetRequestToken()
        {
            try
            {
                var tokenSet = _antiforgery.GetAndStoreTokens(HttpContext);
                return Json(new { key = tokenSet.FormFieldName, value = tokenSet.RequestToken });
            }
            catch
            {
                return BadRequest();
            }
        }
    }
}
