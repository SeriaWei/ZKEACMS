/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Modules.MutiLanguage;
using System.Globalization;
using System.Linq;
using Microsoft.Extensions.DependencyInjection;
using CacheManager.Core;

namespace Easy
{
    public static class Localization
    {
        static ICacheManager<LanguageEntity> LanguageCache;
        static Localization()
        {
            LanguageCache = CacheFactory.Build<LanguageEntity>(settings =>
            {
                settings.WithDictionaryHandle("Localization");
            });
        }
        public static string Get(string lanKey)
        {
            return LanguageCache.GetOrAdd(lanKey, key =>
            {
                using (var languageService = ServiceLocator.GetService<ILanguageService>())
                {
                    var culture = Builder.Configuration["Culture"] ?? CultureInfo.CurrentUICulture.Name;
                    var language = languageService.Get(n => n.LanKey == key && n.CultureName == culture).FirstOrDefault();

                    if (language == null)
                    {
                        string lanValue = key;
                        string lanType = "UnKnown";
                        string module = "Unknown";
                        if (key.Contains("@"))
                        {
                            lanValue = key.Split('@')[1];
                            var translated = languageService.Get(n => n.LanKey.EndsWith("@" + lanValue) && n.CultureName == culture).FirstOrDefault();
                            if (translated != null)
                            {
                                lanValue = translated.LanValue;
                            }
                            lanType = "EntityProperty";
                            module = key.Split('@')[0];
                        }
                        language = new LanguageEntity
                        {
                            CultureName = culture,
                            LanValue = lanValue,
                            LanKey = key,
                            LanType = lanType,
                            Module = module
                        };
                        languageService.Add(language);
                    }

                    return language;
                }

            }).LanValue;
        }

    }
}
