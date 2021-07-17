/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.Mvc.ValueProvider;
using Microsoft.AspNetCore.DataProtection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Captcha;

namespace ZKEACMS.Distribution.Service
{
    public class CookieCaptchaCodeProvider : ICaptchaCodeStorageProvider
    {
        private readonly ICookie _cookie;
        private readonly IDataProtector dataProtector;
        private const string CookieName = "zkdiscap";

        public CookieCaptchaCodeProvider(ICookie cookie, IDataProtectionProvider dataProtectionProvider)
        {
            _cookie = cookie;
            dataProtector = dataProtectionProvider.CreateProtector("ImageCaptcha");
        }

        public string GetCode()
        {
            string code = _cookie.GetValue<string>(CookieName);
            if (code.IsNotNullAndWhiteSpace())
            {
                try
                {
                    return dataProtector.Unprotect(Base64StringDecode(code));
                }
                catch
                {
                    return string.Empty;
                }
            }
            return string.Empty;
        }

        public void SaveCode(string code)
        {
            string protectedCode = dataProtector.Protect(code);

            _cookie.SetValue(CookieName, Base64StringEncode(protectedCode), true, true);
        }
        public string Base64StringEncode(string originalString)
        {
            var bytes = Encoding.UTF8.GetBytes(originalString);

            var encodedString = Convert.ToBase64String(bytes);

            return encodedString;
        }
        public string Base64StringDecode(string encodedString)
        {
            var bytes = Convert.FromBase64String(encodedString);

            var decodedString = Encoding.UTF8.GetString(bytes);

            return decodedString;
        }
    }
}
