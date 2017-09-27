using Microsoft.EntityFrameworkCore;
namespace Easy.RepositoryPattern
{
    public interface IOnDatabaseConfiguring
    {
        void OnConfiguring(DbContextOptionsBuilder optionsBuilder);
    }
}
