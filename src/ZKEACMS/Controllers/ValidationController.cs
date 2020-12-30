/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Captcha;

namespace ZKEACMS.Controllers
{
    public class ValidationController : Controller
    {
        private readonly IImageCaptchaService _validateService;
        public ValidationController(IImageCaptchaService validateService)
        {
            _validateService = validateService;
        }

        public ActionResult Code()
        {
            return File(_validateService.GenerateCode(5), "image/jpeg");
        }

        public JsonResult ValidCode(string code)
        {
            return Json(_validateService.ValidateCode(code));
        }
    }
}
