/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;

namespace ZKEACMS.Setting
{
    public interface IApplicationSettingService : IService<ApplicationSetting>
    {
        string Get(string settingKey, string defaultValue);
        T Get<T>() where T : class, new();
        T Get<T>(string key) where T : class, new();
        void Save<T>(T setting) where T : class, new();
        void Save<T>(string key, T setting) where T : class, new();
    }
}