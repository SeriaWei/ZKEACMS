/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Concurrent;
using System.Linq;
using Easy;
using Easy.Cache;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.DataArchived;

namespace ZKEACMS.Setting
{
    public class ApplicationSettingService : ServiceBase<ApplicationSetting, CMSDbContext>, IApplicationSettingService
    {
        private readonly IDataArchivedService _dataArchivedService;
        private readonly ICacheManager<ApplicationSettingService> _cacheManager;
        private const string ApplicationSetting = "ApplicationSetting";
        public ApplicationSettingService(IApplicationContext applicationContext,
            IDataArchivedService dataArchivedService,
            ICacheManager<ApplicationSettingService> cacheManager,
            CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _dataArchivedService = dataArchivedService;
            _cacheManager = cacheManager;
        }

        public override DbSet<ApplicationSetting> CurrentDbSet => DbContext.ApplicationSetting;

        public override IQueryable<ApplicationSetting> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public override ErrorOr<ApplicationSetting> Add(ApplicationSetting item)
        {
            lock (ApplicationSetting)
            {
                if (base.Get(item.SettingKey) != null) return new Error("SettingKey", ApplicationContext.GetService<ILocalize>().Get("The setting key is already exists"));

                return base.Add(item);
            }

        }
        public override ApplicationSetting Get(params object[] primaryKey)
        {
            return _cacheManager.GetOrCreate(primaryKey[0].ToString(), factory =>
            {
                var entity = base.Get(primaryKey);
                if (entity != null)
                {
                    DbContext.Attach(entity).State = EntityState.Detached;
                }
                return entity;
            });
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

        public override ErrorOr<ApplicationSetting> Update(ApplicationSetting item)
        {
            _cacheManager.Remove(item.SettingKey);
            return base.Update(item);
        }

        public override void Remove(ApplicationSetting item)
        {
            _cacheManager.Remove(item.SettingKey);
            base.Remove(item);
        }
        #region Serialize Settings

        public T Get<T>() where T : class, new()
        {

            return Get<T>(typeof(T).FullName);
        }

        public T Get<T>(string key) where T : class, new()
        {
            return _cacheManager.GetOrCreate(key, factory => _dataArchivedService.Get<T>(key, () => new T())) as T;
        }

        public void Save<T>(T setting) where T : class, new()
        {
            Save<T>(typeof(T).FullName, setting);
        }

        public void Save<T>(string key, T setting) where T : class, new()
        {
            _cacheManager.Remove(key);
            _dataArchivedService.Archive<T>(key, setting);
        }
        #endregion
    }
}