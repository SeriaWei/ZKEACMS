/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using LiteDB;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Storage
{
    public abstract class PluginData<T> : IDisposable where T : PluginBase
    {
        private LiteDatabase Database;
        public PluginData(ILogger<T> logger)
        {
            Database = new LiteDatabase(Path.Combine(PluginBase.GetPath<T>(), "Data.db"));
        }

        public virtual ILiteCollection<TModel> GetCollection<TModel>(string name)
        {
            return Database.GetCollection<TModel>(name);
        }

        public void Dispose()
        {
            Database.Dispose();
        }
    }
}
