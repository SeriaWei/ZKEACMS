/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.Options;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Modules.MutiLanguage
{
    public class Localize : ILocalize
    {
        private IOptions<CultureOption> options;
        private ILanguageService languageService;

        public string Get(string content)
        {
            if (languageService == null)
            {
                languageService = ServiceLocator.GetService<ILanguageService>();
                options = ServiceLocator.GetService<IOptions<CultureOption>>();
            }
            var lanContent = languageService.Get(content, options.Value.Code);
            if (lanContent != null && lanContent.LanValue.IsNotNullAndWhiteSpace())
            {
                return lanContent.LanValue;
            }
            return content;
        }
    }
}
