using System.Collections.Generic;
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
        public EasyDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring) : base(modelCreatings, configuring)
        {
        }

        internal DbSet<DataDictionaryEntity> DataDictionary { get; set; }
        internal DbSet<LanguageEntity> Language { get; set; }
        internal DbSet<Permission> Permission { get; set; }
        internal DbSet<RoleEntity> Roles { get; set; }
        internal DbSet<UserRoleRelation> UserRoleRelation { get; set; }
        internal DbSet<UserEntity> Users { get; set; }
    }
}
