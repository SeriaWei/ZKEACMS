/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.IO;
using System.Linq;
using Easy;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;

namespace ZKEACMS.DataArchived
{
    public class DataArchivedService : ServiceBase<DataArchived, CMSDbContext>, IDataArchivedService
    {
        private const string ArchiveLock = "ArchiveLock";

        public DataArchivedService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public JsonConverter[] JsonConverters { get; set; }

        public override DbSet<DataArchived> CurrentDbSet
        {
            get
            {
                return DbContext.DataArchived;
            }
        }

        public override void Add(DataArchived item)
        {
            lock (ArchiveLock)
            {
                Remove(item.ID);
                base.Add(item);
            }

        }

        public T Get<T>(string key, Func<T> fun) where T : class
        {
            var archived = Get(key);
            T result = null;
            if (archived != null && archived.Data.IsNotNullAndWhiteSpace())
            {
                result = Deserialize<T>(archived.Data);
            }
            if (result == null)
            {
                result = fun();
                Add(new DataArchived { ID = key, Data = Serialize(result) });
            }
            return result;
        }

        private string Serialize(object obj)
        {
            return JsonConvert.SerializeObject(obj, Formatting.None, JsonConverters);
        }

        private T Deserialize<T>(string data) where T : class
        {
            return JsonConvert.DeserializeObject<T>(data, JsonConverters);
        }
    }
}