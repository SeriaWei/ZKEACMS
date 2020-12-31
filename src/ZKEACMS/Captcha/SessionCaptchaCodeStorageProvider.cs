/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.Extend;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ZKEACMS.Captcha
{
    public class SessionCaptchaCodeStorageProvider : ICaptchaCodeStorageProvider
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private const string SessionKey = "ZKEACMS.Captcha.Codes";

        public SessionCaptchaCodeStorageProvider(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public string GetCode()
        {
            return _httpContextAccessor.HttpContext.Session.GetString(SessionKey);
        }

        public void SaveCode(string code)
        {
            _httpContextAccessor.HttpContext.Session.SetString(SessionKey, code);
        }
    }
}
