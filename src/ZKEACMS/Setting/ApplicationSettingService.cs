/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using ZKEACMS.DataArchived;

namespace ZKEACMS.Setting
{
    public class ApplicationSettingService : ServiceBase<ApplicationSetting>, IApplicationSettingService
    {
        private readonly IDataArchivedService _dataArchivedService;
        public ApplicationSettingService(IApplicationContext applicationContext, IDataArchivedService dataArchivedService, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _dataArchivedService = dataArchivedService;
        }

        public override DbSet<ApplicationSetting> CurrentDbSet => (DbContext as CMSDbContext).ApplicationSetting;

        public override ServiceResult<ApplicationSetting> Add(ApplicationSetting item)
        {
            if (Count(m => m.SettingKey == item.SettingKey) == 0)
            {
                return base.Add(item);
            }
            var result = new ServiceResult<ApplicationSetting>();
            result.RuleViolations.Add(new RuleViolation("SettingKey", "已经存在该键值"));
            return result;
        }

        public string Get(string settingKey, string defaultValue)
        {
            var setting = Get(settingKey);
            if (setting == null || setting.Value.IsNullOrWhiteSpace())
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

        #region Serialize Settings

        public T Get<T>() where T : class,new()
        {
            
            return Get<T>(typeof(T).FullName);
        }

        public T Get<T>(string key) where T : class, new()
        {
            return _dataArchivedService.Get<T>(key, () => new T());            
        }

        public void Save<T>(T setting) where T : class, new()
        {
            Save<T>(typeof(T).FullName, setting);
        }

        public void Save<T>(string key, T setting) where T : class, new()
        {
            _dataArchivedService.Archive<T>(key, setting);
        }
        #endregion
    }
}