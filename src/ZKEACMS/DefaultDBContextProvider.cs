/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS
{
    public class DefaultDBContextProvider : IDBContextProvider
    {
        private readonly DbContext _dbContext;

        public DefaultDBContextProvider(CMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public DbContext Current => _dbContext;

        public IEnumerable<DbContext> GetAvailableDbContexts()
        {
            yield return _dbContext;
        }
    }
}
