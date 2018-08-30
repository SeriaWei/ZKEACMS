/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Modules.MutiLanguage;
using System.Globalization;
using System.Linq;
using Microsoft.Extensions.DependencyInjection;
using Easy.Cache;
using Microsoft.Extensions.Options;
using Easy.Options;
using Easy.Extend;
using System;
using Easy.MetaData;

namespace Easy
{
    public static class Localization
    {
        static ICacheManager<LanguageEntity> LanguageCache
        {
            get { return ServiceLocator.GetService<ICacheManager<LanguageEntity>>(); }
        }

        public static string Get(string lanKey)
        {
            return LanguageCache.GetOrAdd(lanKey, key =>
            {
                using (var languageService = ServiceLocator.GetService<ILanguageService>())
                {
                    string culture = CultureInfo.CurrentUICulture.Name;
                    var cultureOption = ServiceLocator.GetService<IOptions<CultureOption>>();
                    if (cultureOption != null && cultureOption.Value.Code.IsNotNullAndWhiteSpace())
                    {
                        culture = cultureOption.Value.Code;
                    }
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
        public static void RemoveCache(string lanKey)
        {
            LanguageCache.Remove(lanKey);
        }
    }
}
