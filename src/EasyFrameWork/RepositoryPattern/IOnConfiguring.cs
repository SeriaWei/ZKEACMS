using Microsoft.EntityFrameworkCore;
namespace Easy.RepositoryPattern
{
    public interface IOnConfiguring
    {
        void OnConfiguring(DbContextOptionsBuilder optionsBuilder);
    }
}
