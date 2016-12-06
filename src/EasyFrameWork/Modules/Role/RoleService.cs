/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.RepositoryPattern;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System;

namespace Easy.Modules.Role
{
    public class RoleService : ServiceBase<RoleEntity, EasyDbContext>, IRoleService
    {
        private readonly IPermissionService _permissionService;
        public RoleService(IPermissionService permissionService, IApplicationContext applicationContext)
            : base(applicationContext)
        {
            _permissionService = permissionService;
        }

        public override DbSet<RoleEntity> CurrentDbSet
        {
            get
            {
                return DbContext.Roles;
            }
        }
    }
}