/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Cache;
using Easy.Modules.MutiLanguage;
using System.Globalization;
using System.Linq;
using Microsoft.Extensions.DependencyInjection;

namespace Easy
{
    public static class Localization
    {
        public static string Get(string lanKey)
        {
            var lanCache = new StaticCache();
            LanguageEntity lan = lanCache.Get(lanKey, m =>
            {
                using (var languageService = ServiceLocator.GetService<ILanguageService>())
                {
                    var culture = Builder.Configuration["Culture"] ?? CultureInfo.CurrentUICulture.Name;
                    var language = languageService.Get(n => n.LanKey == lanKey && n.CultureName == culture).FirstOrDefault();

                    if (language == null)
                    {
                        string lanValue = lanKey;
                        string lanType = "UnKnown";
                        string module = "Unknown";
                        if (lanKey.Contains("@"))
                        {
                            lanValue = lanKey.Split('@')[1];
                            var translated = languageService.Get(n => n.LanKey.EndsWith("@" + lanValue) && n.CultureName == culture).FirstOrDefault();
                            if (translated != null)
                            {
                                lanValue = translated.LanValue;
                            }
                            lanType = "EntityProperty";
                            module = lanKey.Split('@')[0];
                        }
                        language = new LanguageEntity
                        {
                            CultureName = culture,
                            LanValue = lanValue,
                            LanKey = lanKey,
                            LanType = lanType,
                            Module = module
                        };
                        languageService.Add(language);
                    }

                    return language;
                }
            });
            return lan.LanValue;
        }

    }
}
