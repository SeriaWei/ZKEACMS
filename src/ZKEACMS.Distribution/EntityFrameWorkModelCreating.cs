/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Distribution.Models;

namespace ZKEACMS.Distribution
{
    public class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PersistKey>();
        }
    }
}
