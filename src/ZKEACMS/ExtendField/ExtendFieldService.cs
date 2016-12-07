/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.ExtendField
{
    public class ExtendFieldService : ServiceBase<ExtendFieldEntity,CMSDbContext>, IExtendFieldService
    {
        public ExtendFieldService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<ExtendFieldEntity> CurrentDbSet
        {
            get
            {
                return DbContext.ExtendField;
            }
        }
    }
}