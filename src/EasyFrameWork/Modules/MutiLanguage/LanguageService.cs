/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using Easy.Cache;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy.Modules.MutiLanguage
{
    public class LanguageService : ServiceBase<LanguageEntity, EasyDbContext>, ILanguageService
    {
        private readonly ICacheManager<ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>>> _cacheManager;
        public LanguageService(IApplicationContext applicationContext,
            ICacheManager<ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>>> cacheManager,
            EasyDbContext easyDbContext)
            : base(applicationContext, easyDbContext)
        {
            _cacheManager = cacheManager;
        }

        public override DbSet<LanguageEntity> CurrentDbSet
        {
            get { return DbContext.Language; }
        }
        public override IQueryable<LanguageEntity> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }
        public override ServiceResult<LanguageEntity> Add(LanguageEntity item)
        {
            var result = base.Add(item);
            if (!result.HasViolation)
            {
                var dict = GetAll();
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
        public override LanguageEntity Get(params object[] primaryKey)
        {
            LanguageEntity languageEntity = null;
            if (primaryKey.Length == 2)
            {
                if (GetAll().TryGetValue(primaryKey[0].ToString(), out ConcurrentDictionary<string, LanguageEntity> cultureLan))
                {
                    cultureLan.TryGetValue(primaryKey[1].ToString(), out languageEntity);
                }
            }
            return languageEntity;
        }

        public IEnumerable<LanguageEntity> GetCultures(string lanKey)
        {
            if (GetAll().TryGetValue(lanKey, out ConcurrentDictionary<string, LanguageEntity> cultureDic))
            {
                foreach (var item in cultureDic)
                {
                    yield return item.Value;
                }
            }
        }
        public override ServiceResult<LanguageEntity> Update(LanguageEntity item)
        {
            if (GetAll().TryGetValue(item.LanKey.ToString(), out ConcurrentDictionary<string, LanguageEntity> cultureLan))
            {
                if (cultureLan.TryGetValue(item.CultureName, out LanguageEntity oldItem))
                {
                    cultureLan.TryUpdate(item.CultureName, item, oldItem);
                    return base.Update(item);
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
        private ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>> GetAll()
        {
            return _cacheManager.GetOrAdd("AllLanguageEntry", factory =>
            {
                ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>> result = new ConcurrentDictionary<string, ConcurrentDictionary<string, LanguageEntity>>();
                foreach (var item in Get())
                {
                    if (!result.TryGetValue(item.LanKey, out ConcurrentDictionary<string, LanguageEntity> cultureDic))
                    {
                        cultureDic = new ConcurrentDictionary<string, LanguageEntity>();
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
    }
}
