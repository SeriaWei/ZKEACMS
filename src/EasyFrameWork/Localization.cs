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

                    var language = languageService.Get(n => n.LanKey == lanKey && n.CultureName == CultureInfo.CurrentUICulture.Name).FirstOrDefault();

                    if (language == null)
                    {
                        string lanValue = lanKey;
                        string lanType = "UnKnown";
                        string module = "Unknown";
                        if (lanKey.Contains("@"))
                        {
                            lanValue = lanKey.Split('@')[1];
                            lanType = "EntityProperty";
                            module = lanKey.Split('@')[0];
                        }
                        language = new LanguageEntity
                        {
                            CultureName = CultureInfo.CurrentUICulture.Name,
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
