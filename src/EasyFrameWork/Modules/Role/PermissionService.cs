/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy.Modules.Role
{
    public class PermissionService : ServiceBase<Permission, EasyDbContext>, IPermissionService
    {
        public PermissionService(IApplicationContext applicationContext, EasyDbContext easyDbContext) : base(applicationContext, easyDbContext)
        {
        }

        public override DbSet<Permission> CurrentDbSet
        {
            get
            {
                return DbContext.Permission;
            }
        }

    }
}