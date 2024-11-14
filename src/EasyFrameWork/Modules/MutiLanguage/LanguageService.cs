/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Cache;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Serializer;
using FastExpressionCompiler;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using YamlDotNet.Serialization;
using YamlDotNet.Serialization.NamingConventions;

namespace Easy.Modules.MutiLanguage
{
    public class LanguageService : ILanguageService
    {
        private readonly ICacheManager<LanguageService> _cacheManager;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly ISignals _signals;
        private const string LanguageChanged = "LanguageChanged";
        public LanguageService(ICacheManager<LanguageService> cacheManager, IWebHostEnvironment webHostEnvironment, ISignals signals)
        {
            _cacheManager = cacheManager;
            _webHostEnvironment = webHostEnvironment;
            _signals = signals;
        }

        private string GetLocaleDirectory()
        {
            return Path.Combine(_webHostEnvironment.ContentRootPath, "Locale");
        }

        private IEnumerable<LanguageEntity> GetAllFromLocaleFile()
        {
            List<LanguageEntity> entities = new List<LanguageEntity>();
            string localeDir = GetLocaleDirectory();
            string[] localeFiles = Directory.GetFiles(localeDir, "*.yml");
            foreach (string localeFile in localeFiles)
            {
                string cultureName = Path.GetFileNameWithoutExtension(localeFile);
                Dictionary<string, string> localize = ReadLocalizeTextFromFile(localeFile);
                foreach (var item in localize)
                {
                    entities.Add(new LanguageEntity
                    {
                        CultureName = cultureName,
                        LanKey = item.Key,
                        LanValue = item.Value
                    });
                }
            }
            return entities;
        }

        private static Dictionary<string, string> ReadLocalizeTextFromFile(string localeFile)
        {
            string localizeText = File.ReadAllText(localeFile, Encoding.UTF8);
            var localize = YamlConverter.Deserialize<Dictionary<string, string>>(localizeText);
            return localize;
        }

        private static void SaveLocalizeTextToFile(string localeFile, Dictionary<string, string> localizeText)
        {
            string serializedData = YamlConverter.Serialize(localizeText);
            File.WriteAllText(localeFile, serializedData, Encoding.UTF8);
        }

        private ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>> GetAllFromCache()
        {
            return _cacheManager.GetOrCreate("AllLanguageEntry", factory =>
            {
                factory.AddExpirationToken(_signals.When(LanguageChanged));
                factory.AddExpirationToken(_webHostEnvironment.ContentRootFileProvider.Watch("Locale/*.yml"));

                var result = new ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>>(StringComparer.OrdinalIgnoreCase);
                foreach (var item in GetAllFromLocaleFile())
                {
                    if (!result.TryGetValue(item.LanKey, out ConcurrentDictionary<string, LanguageEntity> cultureDic))
                    {
                        cultureDic = new ConcurrentDictionary<string, LanguageEntity>(StringComparer.OrdinalIgnoreCase);
                        cultureDic.TryAdd(item.CultureName, item);
                        result.TryAdd(item.LanKey, cultureDic);
                    }
                    else
                    {
                        if (!cultureDic.ContainsKey(item.CultureName))
                        {
                            cultureDic.TryAdd(item.CultureName, item);
                        }
                    }

                }
                return result;
            });
        }

        private ErrorOr<LanguageEntity> Save(LanguageEntity item)
        {
            var result = new ErrorOr<LanguageEntity>();
            var localeFile = Path.Combine(GetLocaleDirectory(), $"{item.CultureName}.yml");
            try
            {
                var localizeText = ReadLocalizeTextFromFile(localeFile);
                localizeText[item.LanKey] = item.LanValue;
                SaveLocalizeTextToFile(localeFile, localizeText);
                _signals.Trigger(LanguageChanged);
            }
            catch (Exception ex)
            {
                result.AddError(ex.Message);
            }
            return result;
        }

        public ErrorOr<LanguageEntity> Add(LanguageEntity item)
        {
            return Save(item);
        }
        public LanguageEntity Get(string lanKey, string cultureName)
        {
            if (!GetAllFromCache().TryGetValue(lanKey, out ConcurrentDictionary<string, LanguageEntity> cultureLan)) return null;

            if (cultureLan.TryGetValue(cultureName, out LanguageEntity languageEntity)) return languageEntity;

            if (cultureLan.TryGetValue(cultureName.Split('-')[0], out languageEntity)) return languageEntity;
            return null;
        }

        public IEnumerable<LanguageEntity> GetCultures(string lanKey)
        {
            if (GetAllFromCache().TryGetValue(lanKey, out ConcurrentDictionary<string, LanguageEntity> cultureDic))
            {
                foreach (var item in cultureDic)
                {
                    yield return item.Value;
                }
            }
        }
        public ErrorOr<LanguageEntity> Update(LanguageEntity item)
        {
            return Save(item);
        }


        public ErrorOr<LanguageEntity> AddOrUpdate(LanguageEntity entity)
        {
            LanguageEntity translate = Get(entity.LanKey, entity.CultureName);
            if (translate == null)
            {
                return Add(entity);
            }
            else
            {
                translate.LanValue = entity.LanValue;
                return Update(translate);
            }
        }

        public IEnumerable<LanguageEntity> Get(Expression<Func<LanguageEntity, bool>> expression, Pagination pagination)
        {
            var allLanguage = GetAllFromLocaleFile();

            if (pagination.OrderBy.IsNotNullAndWhiteSpace())
            {
                allLanguage = allLanguage.OrderBy(GetPropertyDelegate(pagination.OrderBy));
            }
            else if (pagination.OrderByDescending.IsNotNullAndWhiteSpace())
            {
                allLanguage = allLanguage.OrderByDescending(GetPropertyDelegate(pagination.OrderByDescending));
            }

            if (pagination.ThenBy.IsNotNullAndWhiteSpace())
            {
                allLanguage = (allLanguage as IOrderedEnumerable<LanguageEntity>).ThenBy(GetPropertyDelegate(pagination.ThenBy));
            }
            else if (pagination.ThenByDescending.IsNotNullAndWhiteSpace())
            {
                allLanguage = (allLanguage as IOrderedEnumerable<LanguageEntity>).ThenByDescending(GetPropertyDelegate(pagination.ThenByDescending));
            }
            if (expression != null)
            {
                allLanguage = allLanguage.Where(expression.CompileFast()).ToList();
            }
            pagination.RecordCount = allLanguage.Count();
            return allLanguage.Skip(pagination.PageIndex * pagination.PageSize).Take(pagination.PageSize);
        }

        private Func<LanguageEntity, object> GetPropertyDelegate(string propertyName)
        {
            Type type = typeof(LanguageEntity);

            var objPara = Expression.Parameter(type, "m");
            Expression expProperty = Expression.Property(objPara, propertyName);
            Expression propertyToObject = Expression.Convert(expProperty, typeof(object));
            var propertyDelegateExpression = Expression.Lambda(propertyToObject, objPara);
            return (Func<LanguageEntity, object>)propertyDelegateExpression.CompileFast();
        }

        public string[] GetCultureCodes()
        {
            return Directory.GetFiles(GetLocaleDirectory(), "*.yml").Select(m => Path.GetFileNameWithoutExtension(m)).ToArray();
        }
    }
}
