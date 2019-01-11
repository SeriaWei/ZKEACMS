/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;

namespace Easy.Modules.Role
{
    public class UserRoleRelationService : ServiceBase<UserRoleRelation, EasyDbContext>, IUserRoleRelationService
    {
        public UserRoleRelationService(IApplicationContext applicationContext, EasyDbContext easyDbContext) : base(applicationContext, easyDbContext)
        {
        }

        public override DbSet<UserRoleRelation> CurrentDbSet
        {
            get
            {
                return DbContext.UserRoleRelation;
            }
        }
    }
}