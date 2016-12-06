using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;

namespace Easy.RepositoryPattern
{
    public static class DbContextConfig
    {
        static DbContextConfig()
        {
            var serviceLocator = new ServiceLocator();
            OnModelCreatings = serviceLocator.GetServices<IOnModelCreating>();
            OnConfigurings = serviceLocator.GetServices<IOnConfiguring>();
        }
        public static IEnumerable<IOnModelCreating> OnModelCreatings { get; }
        public static IEnumerable<IOnConfiguring> OnConfigurings { get; }
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
            if (DbContextConfig.OnConfigurings != null)
            {
                foreach (var item in DbContextConfig.OnConfigurings)
                {
                    item.OnConfiguring(optionsBuilder);
                }
            }
        }
    }
}