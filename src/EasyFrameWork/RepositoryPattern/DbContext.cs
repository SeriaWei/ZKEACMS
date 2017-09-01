using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using System.Linq;

namespace Easy.RepositoryPattern
{
    public class DbContextBase : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            var creatings = ServiceLocator.GetServices<IOnModelCreating>();
            if (creatings != null)
            {
                foreach (var item in creatings)
                {
                    item.OnModelCreating(modelBuilder);
                }
            }
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var config = ServiceLocator.GetService<IOnConfiguring>();
            if (config != null)
            {
                config.OnConfiguring(optionsBuilder);
            }
        }
    }
}