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
        private const string DefaultKey = "Default";

        public SessionCaptchaCodeStorageProvider(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public string GetCode(string key)
        {
            if (key.IsNullOrWhiteSpace())
            {
                key = DefaultKey;
            }
            var codes = GetCodes();
            string code;
            if (codes.TryGetValue(key, out code))
            {
                return code;
            }

            return string.Empty;
        }

        public void SaveCode(string key, string code)
        {
            if (key.IsNullOrWhiteSpace())
            {
                key = DefaultKey;
            }
            var codes = GetCodes();
            codes[key] = code;

            SaveToSession(codes);
        }

        private void SaveToSession(Dictionary<string, string> codes)
        {
            string json = JsonSerializer.Serialize(codes);
            byte[] sessionData = Encoding.UTF8.GetBytes(json);
            _httpContextAccessor.HttpContext.Session.Set(SessionKey, sessionData);
        }

        private Dictionary<string, string> GetCodes()
        {
            byte[] sessionData;
            if (_httpContextAccessor.HttpContext.Session.TryGetValue(SessionKey, out sessionData))
            {
                string json = Encoding.UTF8.GetString(sessionData);
                return JsonSerializer.Deserialize<Dictionary<string, string>>(json);
            }
            return new Dictionary<string, string>();
        }
    }
}
