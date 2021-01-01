/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Captcha;

namespace ZKEACMS.Controllers
{
    public class CaptchaController : Controller
    {
        private readonly IImageCaptchaService _imageCaptchaService;
        public CaptchaController(IImageCaptchaService imageCaptchaService)
        {
            _imageCaptchaService = imageCaptchaService;
        }

        public ActionResult Image()
        {
            return File(_imageCaptchaService.GenerateCode(4), "image/jpeg");
        }
    }
}
