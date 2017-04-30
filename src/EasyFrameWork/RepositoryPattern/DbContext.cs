using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using System.Linq;

namespace Easy.RepositoryPattern
{
    public static class DbContextConfig
    {
        static DbContextConfig()
        {
            OnModelCreatings = ServiceLocator.GetServices<IOnModelCreating>();
            OnConfiguring = ServiceLocator.GetService<IOnConfiguring>();
        }
        public static IEnumerable<IOnModelCreating> OnModelCreatings { get; }
        public static IOnConfiguring OnConfiguring { get; }
    }
    public class DbContextBase : DbContext
    {
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            if (DbContextConfig.OnModelCreatings != null)
            {
                foreach (var item in DbContextConfig.OnModelCreatings)
                {
                    item.OnModelCreating(modelBuilder);
                }
            }
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (DbContextConfig.OnConfiguring != null)
            {
                DbContextConfig.OnConfiguring.OnConfiguring(optionsBuilder);
            }
        }
    }
}