using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.RepositoryPattern
{
    public class DbContext<T> : DbContext where T : class
    {
        public virtual DbSet<T> Instance { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            var services = new ServiceLocator().GetServices<IOnModelCreating>();
            if (services != null)
            {
                foreach (var item in services)
                {
                    item.OnModelCreating(modelBuilder);
                }
            }
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

            var services = new ServiceLocator().GetServices<IOnConfiguring>();
            if (services != null)
            {
                foreach (var item in services)
                {
                    item.OnConfiguring(optionsBuilder);
                }
            }
        }
    }
}