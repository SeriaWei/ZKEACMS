using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZKEACMS.Distribution.Models;

namespace ZKEACMS.Distribution.Service
{
    public class PersistKeyService : IPersistKeyService
    {
        private readonly CMSDbContext _dbContext;

        public PersistKeyService(CMSDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public List<PersistKey> GetPersistKeys()
        {
            return _dbContext.Set<PersistKey>().ToList();
        }

        public void Save(PersistKey persistKey)
        {
            _dbContext.Set<PersistKey>().Add(persistKey);
            _dbContext.SaveChanges();
        }
    }
}
