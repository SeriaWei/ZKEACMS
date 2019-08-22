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
        public ApplicationSettingService(IApplicationContext applicationContext,
            IDataArchivedService dataArchivedService,
            ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _dataArchivedService = dataArchivedService;
            _settingCache = cacheManager.GetOrAdd(ApplicationSetting, new ConcurrentDictionary<string, object>());
        }

        public override DbSet<ApplicationSetting> CurrentDbSet => DbContext.ApplicationSetting;

        public override IQueryable<ApplicationSetting> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public override ServiceResult<ApplicationSetting> Add(ApplicationSetting item)
        {
            if (Count(m => m.SettingKey == item.SettingKey) == 0)
            {
                _settingCache.TryAdd(item.SettingKey, item);
                return base.Add(item);
            }
            var result = new ServiceResult<ApplicationSetting>();
            result.RuleViolations.Add(new RuleViolation("SettingKey", "已经存在该键值"));
            return result;
        }
        public override ApplicationSetting Get(params object[] primaryKey)
        {
            object value;
            if (_settingCache.TryGetValue(primaryKey[0].ToString(), out value))
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
            object oldSetting;
            if (_settingCache.TryGetValue(item.SettingKey, out oldSetting))
            {
                _settingCache.TryUpdate(item.SettingKey, item, oldSetting);
            }
            return base.Update(item);
        }

        public override void Remove(ApplicationSetting item)
        {
            object oldSetting;
            _settingCache.TryRemove(item.SettingKey, out oldSetting);
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
            object oldSetting;
            if (_settingCache.TryGetValue(key, out oldSetting))
            {
                _settingCache.TryUpdate(key, setting, oldSetting);
            }
            _dataArchivedService.Archive<T>(key, setting);
        }
        #endregion
    }
}