/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.Options;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Modules.MutiLanguage
{
    public class Localize : ILocalize
    {
        private readonly IServiceProvider _serviceProvider;
        public Localize(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }
        private string cultureCode;
        public string CultureCode
        {
            get
            {
                return cultureCode ?? (cultureCode = _serviceProvider.GetService<IOptions<CultureOption>>().Value.Code);
            }
        }
        private ILanguageService languageService;
        private ILanguageService LanguageService
        {
            get
            {
                return languageService ?? (languageService = _serviceProvider.GetService<ILanguageService>());
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
            return GetOrNull(content, CultureCode);
        }

        public string GetOrNull(string content, string culture)
        {
            var lanContent = LanguageService.Get(content, culture);
            if (lanContent != null && lanContent.LanValue.IsNotNullAndWhiteSpace())
            {
                return lanContent.LanValue;
            }
            return null;
        }
    }
}
