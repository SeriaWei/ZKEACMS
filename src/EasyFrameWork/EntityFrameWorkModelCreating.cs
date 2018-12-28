/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Modules.MutiLanguage;
using Easy.Modules.Role;
using Easy.Modules.User.Models;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Easy
{
    class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Permission>().HasKey(m => new { m.PermissionKey, m.RoleId });
            modelBuilder.Entity<LanguageEntity>().HasKey(m => new { m.LanKey, m.CultureName });
        }
    }
}
