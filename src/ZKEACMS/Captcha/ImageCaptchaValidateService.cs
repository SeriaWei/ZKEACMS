/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Extend;
using Easy.Cache;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS.Captcha
{
    public class ImageCaptchaValidateService : IImageCaptchaService
    {
        private const string ValidateCodeKey = "Session_ValidateCode_{0}";
        private readonly IHttpContextAccessor _httpContextAccessor;
        public ImageCaptchaValidateService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public byte[] GenerateCode(int num = 5)
        {
            ImageCaptcha validateCode = new ImageCaptcha();
            string code = validateCode.CreateValidateCode(num);
            _httpContextAccessor.HttpContext.Session.SetString(ValidateCodeKey, code);
            return validateCode.CreateValidateGraphic(code);
        }

        public bool ValidateCode(string code)
        {
            if (code.IsNullOrWhiteSpace()) return false;

            return code.Equals(GetCode());
        }

        public string GetCode()
        {
            return _httpContextAccessor.HttpContext.Session.GetString(ValidateCodeKey);
        }
    }
}
