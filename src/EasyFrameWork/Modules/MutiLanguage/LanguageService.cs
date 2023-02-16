/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Easy.Cache;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Serializer;
using FastExpressionCompiler;

namespace Easy.Modules.MutiLanguage
{
    public class LanguageService : ILanguageService
    {
        private readonly ICacheManager<ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>>> _cacheManager;
        public LanguageService(ICacheManager<ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>>> cacheManager)
        {
            _cacheManager = cacheManager;
        }
        private LanguageEntity ParseLanguage(string text, string cultureName)
        {
            string[] keyValue = text.Split('=', 2);
            if (keyValue.Length < 2)
            {
                return new LanguageEntity
                {
                    LanKey = text,
                    CultureName = cultureName
                };
            }
            return new LanguageEntity
            {
                LanKey = keyValue[0],
                LanValue = Deserialize(keyValue[1]),
                CultureName = cultureName
            };
        }

        private string Serialize(string value)
        {
            return JsonConverter.Serialize(value);
        }
        private string Deserialize(string value)
        {
            return JsonConverter.Deserialize(value, typeof(string)).ToString();
        }
        private string GetLocaleDirectory()
        {
            return Path.Combine(Directory.GetCurrentDirectory(), "Locale");
        }
        private IEnumerable<LanguageEntity> GetAllFromLocaleFile()
        {
            List<LanguageEntity> entities = new List<LanguageEntity>();
            string localeDir = GetLocaleDirectory();
            string[] localeFiles = Directory.GetFiles(localeDir, "*.ini");
            foreach (string localeFile in localeFiles)
            {
                string cultureName = Path.GetFileNameWithoutExtension(localeFile);

                FetchFileLines(localeFile, line =>
                {
                    entities.Add(ParseLanguage(line, cultureName));
                });
            }
            return entities;
        }
        private void FetchFileLines(string localeFile, Action<string> onLineReaded)
        {
            using (var fileReader = File.OpenRead(localeFile))
            {
                using (StreamReader reader = new StreamReader(fileReader, Encoding.UTF8))
                {
                    string line;
                    while ((line = reader.ReadLine()) != null)
                    {
                        onLineReaded(line);
                    }
                }
            }
        }
        private string SerializeToLine(LanguageEntity language)
        {
            return $"{language.LanKey}={Serialize(language.LanValue)}";
        }
        private ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>> GetAllFromCache()
        {
            return _cacheManager.GetOrAdd("AllLanguageEntry", factory =>
            {
                ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>> result = new ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>>(StringComparer.OrdinalIgnoreCase);
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
        public ServiceResult<LanguageEntity> Add(LanguageEntity item)
        {
            var result = new ServiceResult<LanguageEntity>();
            var localeFile = Path.Combine(GetLocaleDirectory(), $"{item.CultureName}.ini");
            try
            {
                using (var fileWriter = File.AppendText(localeFile))
                {
                    fileWriter.WriteLine(SerializeToLine(item));
                }
            }
            catch (Exception ex)
            {
                result.AddRuleViolation(ex.Message);
            }
            if (!result.HasViolation)
            {
                var dict = GetAllFromCache();
                if (dict.ContainsKey(item.LanKey))
                {
                    dict[item.LanKey].TryAdd(item.CultureName, item);
                }
                else
                {
                    ConcurrentDictionary<string, LanguageEntity> cultureDic = new ConcurrentDictionary<string, LanguageEntity>();
                    cultureDic.TryAdd(item.CultureName, item);
                    dict.TryAdd(item.LanKey, cultureDic);
                }
            }
            return result;
        }
        public LanguageEntity Get(string lanKey, string cultureName)
        {
            LanguageEntity languageEntity = null;
            if (GetAllFromCache().TryGetValue(lanKey, out ConcurrentDictionary<string, LanguageEntity> cultureLan))
            {
                cultureLan.TryGetValue(cultureName, out languageEntity);
            }
            return languageEntity;
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
        public ServiceResult<LanguageEntity> Update(LanguageEntity item)
        {
            if (GetAllFromCache().TryGetValue(item.LanKey.ToString(), out ConcurrentDictionary<string, LanguageEntity> cultureLan))
            {
                if (cultureLan.TryGetValue(item.CultureName, out LanguageEntity oldItem))
                {
                    cultureLan.TryUpdate(item.CultureName, item, oldItem);

                    var result = new ServiceResult<LanguageEntity>();
                    try
                    {
                        var localeFile = Path.Combine(GetLocaleDirectory(), $"{item.CultureName}.ini");
                        StringBuilder newlocaleText = new StringBuilder();
                        string lanKeyIdentity = $"{item.LanKey}=";
                        FetchFileLines(localeFile, line =>
                        {
                            if (!line.StartsWith(lanKeyIdentity))
                            {
                                newlocaleText.AppendLine(line);
                            }
                            else
                            {
                                newlocaleText.AppendLine(SerializeToLine(item));
                            }
                        });
                        File.WriteAllText(localeFile, newlocaleText.ToString());
                    }
                    catch (Exception ex)
                    {
                        result.AddRuleViolation(ex.Message);
                    }
                    return result;
                }
                else
                {
                    return Add(item);
                }
            }
            else
            {
                return Add(item);
            }
        }


        public ServiceResult<LanguageEntity> AddOrUpdate(LanguageEntity entity)
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
    }
}
