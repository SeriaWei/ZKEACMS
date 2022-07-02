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
        private readonly Stream _dbStream;
        private readonly Stream _dbLogStream;
        private LiteDatabase Database;
        public PluginData(ILogger<T> logger)
        {
            try
            {
                Database = new LiteDatabase(Path.Combine(PluginBase.GetPath<T>(), "Data.db"));
            }
            catch (Exception ex)
            {
                logger.LogError("Can not use persistent file storage, use memory storage instead.");
                logger.LogError(ex, ex.Message);
                _dbStream = new MemoryStream();
                _dbLogStream = new MemoryStream();
                Database = new LiteDatabase(_dbStream, null, _dbLogStream);
            }
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
