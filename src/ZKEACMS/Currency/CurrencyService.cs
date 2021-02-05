using Easy;
/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Currency
{
    public class CurrencyService : ServiceBase<CurrencyEntry>, ICurrencyService
    {
        public CurrencyService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override IQueryable<CurrencyEntry> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }
    }
}
