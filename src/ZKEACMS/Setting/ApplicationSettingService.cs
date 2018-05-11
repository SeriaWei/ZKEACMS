/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace ZKEACMS.Setting
{
    public class ApplicationSettingService : ServiceBase<ApplicationSetting>, IApplicationSettingService
    {
        public ApplicationSettingService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

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

        public T Get<T>() where T : new()
        {
            return Get<T>(typeof(T).FullName);
        }

        public T Get<T>(string key) where T : new()
        {
            var setting = Get(key);
            if (setting == null)
            {
                setting = new ApplicationSetting { SettingKey = key, Value = JsonConvert.SerializeObject(new T()) };
                Add(setting);
            }
            return JsonConvert.DeserializeObject<T>(setting.Value);
        }

        public void Save<T>(T setting)
        {
            Save<T>(typeof(T).FullName, setting);
        }

        public void Save<T>(string key, T setting)
        {
            var settingEntry = Get(key);
            if (settingEntry == null)
            {
                settingEntry = new ApplicationSetting { SettingKey = key, Value = JsonConvert.SerializeObject(setting) };
                Add(settingEntry);
            }
            else
            {
                settingEntry.Value = JsonConvert.SerializeObject(setting);
                Update(settingEntry);
            }
        }
    }
}