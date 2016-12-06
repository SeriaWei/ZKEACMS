using Easy.Modules.DataDictionary;
using Easy.Modules.MutiLanguage;
using Easy.Modules.Role;
using Easy.Modules.User.Models;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy
{
    public class EasyDbContext : DbContextBase
    {
        public DbSet<DataDictionaryEntity> DataDictionary { get; set; }
        public DbSet<LanguageEntity> Language { get; set; }
        public DbSet<Permission> Permission { get; set; }
        public DbSet<RoleEntity> Roles { get; set; }
        public DbSet<UserRoleRelation> UserRoleRelation { get; set; }
        public DbSet<UserEntity> Users { get; set; }
    }
}
