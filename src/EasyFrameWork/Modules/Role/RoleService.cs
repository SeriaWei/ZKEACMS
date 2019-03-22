/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.RepositoryPattern;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using Easy.Constant;
using System.Linq.Expressions;

namespace Easy.Modules.Role
{
    public class RoleService : ServiceBase<RoleEntity, EasyDbContext>, IRoleService
    {
        private readonly IPermissionService _permissionService;
        private readonly IUserRoleRelationService _userRoleRelationService;
        public RoleService(IPermissionService permissionService,
            IUserRoleRelationService userRoleRelationService,
            IApplicationContext applicationContext,
            EasyDbContext easyDbContext)
            : base(applicationContext, easyDbContext)
        {
            _permissionService = permissionService;
            _userRoleRelationService = userRoleRelationService;
        }

        public override DbSet<RoleEntity> CurrentDbSet
        {
            get
            {
                return DbContext.Roles;
            }
        }

        public ServiceResult<RoleEntity> Add(RoleEntity roleEntity, List<PermissionDescriptor> permissionDescriptors)
        {
            return BeginTransaction(() =>
            {
                var result = Add(roleEntity);
                if (result.HasViolation) return result;
                var permissions = new List<Permission>();
                permissionDescriptors.Where(m => m.Checked ?? false).Each(m =>
                {
                    permissions.Add(new Permission
                    {
                        RoleId = roleEntity.ID,
                        PermissionKey = m.Key,
                        Module = m.Module,
                        Title = m.Title,
                        ActionType = ActionType.Create
                    });
                });
                _permissionService.AddRange(permissions.ToArray());
                return result;
            });
        }

        public IList<Permission> GetPermission(int roleId)
        {
            return _permissionService.Get(m => m.RoleId == roleId);
        }

        public ServiceResult<RoleEntity> Update(RoleEntity roleEntity, List<PermissionDescriptor> permissionDescriptors)
        {
            return BeginTransaction(() =>
            {
                var permissions = _permissionService.Get(m => m.RoleId == roleEntity.ID);
                permissions.Each(m => m.ActionType = ActionType.Delete);
                permissionDescriptors.Where(m => m.Checked ?? false).Each(m =>
                {
                    bool exists = false;
                    foreach (var item in permissions)
                    {
                        if (item.PermissionKey == m.Key)
                        {
                            item.ActionType = ActionType.Update;
                            exists = true;
                        }
                    }
                    if (!exists)
                    {
                        permissions.Add(new Permission
                        {
                            RoleId = roleEntity.ID,
                            PermissionKey = m.Key,
                            Module = m.Module,
                            Title = m.Title,
                            ActionType = ActionType.Create
                        });
                    }

                });
                _permissionService.BeginBulkSave();
                permissions.Each(m =>
                {
                    switch (m.ActionType)
                    {
                        case ActionType.Create:
                            {
                                _permissionService.Add(m);
                                break;
                            }
                        case ActionType.Update:
                            {
                                _permissionService.Update(m);
                                break;
                            }
                        case ActionType.Delete:
                            {
                                _permissionService.Remove(m);
                                break;
                            }
                    }
                });
                _permissionService.SaveChanges();

                var old = Get(roleEntity.ID);
                roleEntity.CopyTo(old);
                return Update(old);
            });
        }

        public override void Remove(RoleEntity item)
        {
            BeginTransaction(() =>
            {
                _permissionService.Remove(m => m.RoleId == item.ID);
                _userRoleRelationService.Remove(m => m.RoleID == item.ID);
                base.Remove(item);
            });
        }
        public override void Remove(Expression<Func<RoleEntity, bool>> filter)
        {
            RemoveRange(Get(filter).ToArray());
        }
        public override void RemoveRange(params RoleEntity[] items)
        {
            BeginTransaction(() =>
            {
                int[] roles = items.Select(m => m.ID).ToArray();
                _permissionService.Remove(m => roles.Contains(m.RoleId));
                _userRoleRelationService.Remove(m => roles.Contains(m.RoleID));
                base.RemoveRange(items);
            });
        }
    }
}