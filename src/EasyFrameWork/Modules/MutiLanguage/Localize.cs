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
        private readonly IOptions<CultureOption> _options;
        private readonly ILanguageService _languageService;
        public Localize(IOptions<CultureOption> options, ILanguageService languageService)
        {
            _options = options;
            _languageService = languageService;
        }
        public string Get(string content)
        {
            var lanContent = _languageService.Get(content, _options.Value.Code);
            if (lanContent != null && lanContent.LanValue.IsNotNullAndWhiteSpace())
            {
                return lanContent.LanValue;
            }
            return content;
        }
    }
}
