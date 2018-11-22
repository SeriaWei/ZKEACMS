/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.RepositoryPattern;
using Newtonsoft.Json;

namespace ZKEACMS.DataArchived
{
    public interface IDataArchivedService : IService<DataArchived>
    {
        JsonConverter[] JsonConverters { get; set; }
        T Get<T>(string key, Func<T> fun) where T : class;
        void Archive<T>(string key, T obj);
    }
}