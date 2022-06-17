/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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

        public DataArchivedService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override DbSet<DataArchived> CurrentDbSet => DbContext.DataArchived;

        public JsonConverter[] JsonConverters { get; set; }

        public override IQueryable<DataArchived> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public override DataArchived Get(params object[] primaryKey)
        {
            string key = primaryKey[0].ToString();
            return Get().FirstOrDefault(m => m.ID == key);
        }

        public override ServiceResult<DataArchived> Add(DataArchived item)
        {
            lock (ArchiveLock)
            {
                Remove(item.ID);
                return base.Add(item);
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

        public T Get<T>(string key) where T : class
        {
            var archived = Get(key);
            T result = null;
            if (archived != null && archived.Data.IsNotNullAndWhiteSpace())
            {
                result = Deserialize<T>(archived.Data);
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

        public void Archive<T>(string key, T obj)
        {
            var archived = Get(key);
            if (archived == null)
            {
                archived = new DataArchived
                {
                    ID = key,
                    Data = Serialize(obj)
                };
                base.Add(archived);
            }
            else
            {
                archived.Data = Serialize(obj);
                Update(archived);
            }
        }

    }
}