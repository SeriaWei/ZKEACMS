/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Concurrent;
using System.Linq;
using Easy;
using Easy.Cache;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using ZKEACMS.DataArchived;

namespace ZKEACMS.Setting
{
    public class ApplicationSettingService : ServiceBase<ApplicationSetting, CMSDbContext>, IApplicationSettingService
    {
        private readonly IDataArchivedService _dataArchivedService;
        private readonly ConcurrentDictionary<string, object> _settingCache;
        private const string ApplicationSetting = "ApplicationSetting";
        private readonly ILocalize _localize;
        public ApplicationSettingService(IApplicationContext applicationContext,
            IDataArchivedService dataArchivedService,
            ILocalize localize,
            ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _dataArchivedService = dataArchivedService;
            _localize = localize;
            _settingCache = cacheManager.GetOrAdd(ApplicationSetting, new ConcurrentDictionary<string, object>());
        }

        public override DbSet<ApplicationSetting> CurrentDbSet => DbContext.ApplicationSetting;

        public override IQueryable<ApplicationSetting> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public override ServiceResult<ApplicationSetting> Add(ApplicationSetting item)
        {
            lock (ApplicationSetting)
            {
                if (base.Get(item.SettingKey) == null)
                {
                    _settingCache.TryAdd(item.SettingKey, item);
                    return base.Add(item);
                }
                var result = new ServiceResult<ApplicationSetting>();
                result.RuleViolations.Add(new RuleViolation("SettingKey", _localize.Get("The setting key is already exists")));
                return result;
            }

        }
        public override ApplicationSetting Get(params object[] primaryKey)
        {
            if (_settingCache.TryGetValue(primaryKey[0].ToString(), out object value))
            {
                return value as ApplicationSetting;
            }
            var entity = base.Get(primaryKey);
            if (entity != null)
            {
                DbContext.Attach(entity).State = EntityState.Detached;
                _settingCache.TryAdd(entity.SettingKey, entity);
            }
            return null;
        }
        public string Get(string settingKey, string defaultValue)
        {
            var setting = Get(settingKey);
            if (setting == null || setting.Value == null)
            {
                if (setting == null && defaultValue.IsNotNullAndWhiteSpace())
                {
                    Add(new ApplicationSetting { SettingKey = settingKey, Value = defaultValue, Status = (int)RecordStatus.Active });
                }
                return defaultValue;
            }
            if (setting.Status != (int)RecordStatus.Active)
            {
                return defaultValue;
            }
            return setting.Value;
        }

        public override ServiceResult<ApplicationSetting> Update(ApplicationSetting item)
        {
            if (_settingCache.TryGetValue(item.SettingKey, out object oldSetting))
            {
                _settingCache.TryUpdate(item.SettingKey, item, oldSetting);
            }
            return base.Update(item);
        }

        public override void Remove(ApplicationSetting item)
        {
            _settingCache.TryRemove(item.SettingKey, out _);
            base.Remove(item);
        }
        #region Serialize Settings

        public T Get<T>() where T : class, new()
        {

            return Get<T>(typeof(T).FullName);
        }

        public T Get<T>(string key) where T : class, new()
        {
            return _settingCache.GetOrAdd(key, k => _dataArchivedService.Get<T>(k, () => new T())) as T;
        }

        public void Save<T>(T setting) where T : class, new()
        {
            Save<T>(typeof(T).FullName, setting);
        }

        public void Save<T>(string key, T setting) where T : class, new()
        {
            if (_settingCache.TryGetValue(key, out object oldSetting))
            {
                _settingCache.TryUpdate(key, setting, oldSetting);
            }
            _dataArchivedService.Archive<T>(key, setting);
        }
        #endregion
    }
}