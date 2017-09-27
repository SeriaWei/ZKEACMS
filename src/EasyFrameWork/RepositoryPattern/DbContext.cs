using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System.Collections.Generic;
using System.Linq;

namespace Easy.RepositoryPattern
{
    public class DbContextBase : DbContext
    {
        public DbContextBase(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring)
        {
            Creatings = modelCreatings;
            DatabaseConfiguring = configuring;
        }
        public IEnumerable<IOnModelCreating> Creatings { get; set; }
        public IOnDatabaseConfiguring DatabaseConfiguring { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            if (Creatings != null)
            {
                foreach (var item in Creatings)
                {
                    item.OnModelCreating(modelBuilder);
                }
            }
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (DatabaseConfiguring != null)
            {
                DatabaseConfiguring.OnConfiguring(optionsBuilder);
            }
        }
    }
}