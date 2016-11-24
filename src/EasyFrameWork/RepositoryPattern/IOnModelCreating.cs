using Microsoft.EntityFrameworkCore;
namespace Easy.RepositoryPattern
{
    public interface IOnModelCreating
    {
        void OnModelCreating(ModelBuilder modelBuilder);
    }
}