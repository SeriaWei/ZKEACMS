/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

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
            result.RuleViolations.Add(new RuleViolation("SettingKey", "�Ѿ����ڸü�ֵ"));
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
    }
}