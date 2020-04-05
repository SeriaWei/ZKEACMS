/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.Options;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Easy.Modules.MutiLanguage
{
    public class Localize : ILocalize
    {
        private ILanguageService _languageService;
        List<string> cultureCodes = new List<string>();
        public Localize(ILanguageService languageService, IOptions<CultureOption> options, IHttpContextAccessor httpContextAccessor)
        {
            _languageService = languageService;

            var userLan = httpContextAccessor.HttpContext.Request.GetUserLanguages().FirstOrDefault();

            if (userLan.IsNotNullAndWhiteSpace())
            {
                cultureCodes.Add(userLan);
            }
            if (userLan != options.Value.Code)
            {
                cultureCodes.Add(options.Value.Code);
            }
        }
        public string Get(string content)
        {
            return GetOrNull(content) ?? content;
        }

        public string Get(string content, string culture)
        {
            return GetOrNull(content, culture) ?? content;
        }

        public string GetOrNull(string content)
        {
            foreach (var item in cultureCodes)
            {
                string lanValue = GetOrNull(content, item);
                if (lanValue.IsNotNullAndWhiteSpace())
                {
                    return lanValue;
                }
            }
            return null;
        }

        public string GetOrNull(string content, string culture)
        {
            var lanContent = _languageService.Get(content, culture);
            if (lanContent != null && lanContent.LanValue.IsNotNullAndWhiteSpace())
            {
                return lanContent.LanValue;
            }
            return null;
        }
    }
}
