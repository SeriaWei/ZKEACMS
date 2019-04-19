/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using System.Linq;

namespace Easy.RepositoryPattern
{
    public class DbContextBase : DbContext
    {
        public DbContextBase(DbContextOptions dbContextOptions) : base(dbContextOptions)
        {
        }
        public IEnumerable<IOnModelCreating> ModelCreatings { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            if (ModelCreatings != null)
            {
                foreach (var item in ModelCreatings)
                {
                    item.OnModelCreating(modelBuilder);
                }
            }
        }
    }
}