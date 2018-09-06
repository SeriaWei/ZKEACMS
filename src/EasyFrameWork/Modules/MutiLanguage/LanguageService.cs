/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Cache;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy.Modules.MutiLanguage
{
    public class LanguageService : ServiceBase<LanguageEntity>, ILanguageService
    {
        private readonly ICacheManager<Dictionary<string, Dictionary<string, LanguageEntity>>> _cacheManager;
        public LanguageService(IApplicationContext applicationContext, ICacheManager<Dictionary<string, Dictionary<string, LanguageEntity>>> cacheManager, EasyDbContext easyDbContext) : base(applicationContext, easyDbContext)
        {
            _cacheManager = cacheManager;
        }

        public override DbSet<LanguageEntity> CurrentDbSet
        {
            get { return (DbContext as EasyDbContext).Language; }
        }
        public override LanguageEntity Get(params object[] primaryKey)
        {
            LanguageEntity languageEntity = null;
            if (primaryKey.Length == 2)
            {
                Dictionary<string, LanguageEntity> cultureLan;
                if (GetAll().TryGetValue(primaryKey[0].ToString(), out cultureLan))
                {
                    cultureLan.TryGetValue(primaryKey[1].ToString(), out languageEntity);
                }
            }
            return languageEntity;
        }

        public IEnumerable<LanguageEntity> GetCultures(string lanKey)
        {
            Dictionary<string, LanguageEntity> cultureDic;
            if (GetAll().TryGetValue(lanKey, out cultureDic))
            {
                foreach (var item in cultureDic)
                {
                    yield return item.Value;
                }
            }
        }
        public override ServiceResult<LanguageEntity> Update(LanguageEntity item)
        {
            Dictionary<string, LanguageEntity> cultureLan;
            if (GetAll().TryGetValue(item.LanKey.ToString(), out cultureLan))
            {
                cultureLan[item.CultureName] = item;
            }
            return base.Update(item);
        }
        private Dictionary<string, Dictionary<string, LanguageEntity>> GetAll()
        {
            return _cacheManager.GetOrAdd("AllLanguageEntry", factory =>
            {
                Dictionary<string, Dictionary<string, LanguageEntity>> result = new Dictionary<string, Dictionary<string, LanguageEntity>>();
                foreach (var item in Get())
                {
                    Dictionary<string, LanguageEntity> cultureDic;
                    if (!result.TryGetValue(item.LanKey, out cultureDic))
                    {
                        cultureDic = new Dictionary<string, LanguageEntity> { { item.CultureName, item } };
                        result.Add(item.LanKey, cultureDic);
                    }
                    else
                    {
                        if (!cultureDic.ContainsKey(item.CultureName))
                        {
                            cultureDic.Add(item.CultureName, item);
                        }
                    }

                }
                return result;
            });
        }
    }
}
