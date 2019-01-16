/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy.Modules.DataDictionary
{
    public class DataDictionaryService : ServiceBase<DataDictionaryEntity, EasyDbContext>, IDataDictionaryService
    {
        public DataDictionaryService(IApplicationContext applicationContext, EasyDbContext easyDbContext) : base(applicationContext, easyDbContext)
        {
        }

        public override DbSet<DataDictionaryEntity> CurrentDbSet { get { return DbContext.DataDictionary; } }

    }
}
