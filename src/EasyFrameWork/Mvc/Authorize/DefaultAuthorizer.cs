/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.Linq;
using Easy.Constant;
using Easy.Extend;
using Easy.Models;
using Easy.Modules.Role;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.Authorize
{
    public class DefaultAuthorizer : IAuthorizer
    {
        public DefaultAuthorizer(IApplicationContext applicationContext,
            IRoleService roleService,
            IUserRoleRelationService userRoleRelationService,
            IPermissionService permissionService)
        {
            ApplicationContext = applicationContext;
            RoleService = roleService;
            UserRoleRelationService = userRoleRelationService;
            PermissionService = permissionService;
        }
        public IApplicationContext ApplicationContext { get; set; }
        public IRoleService RoleService { get; set; }
        public IUserRoleRelationService UserRoleRelationService { get; set; }
        public IPermissionService PermissionService { get; set; }
        private Dictionary<string, IEnumerable<Permission>> _userPermissions;
        public bool Authorize(string permission)
        {
            return Authorize(permission, ApplicationContext.CurrentUser);
        }

        public bool Authorize(string permission, IUser user)
        {
            if (!ApplicationContext.IsAuthenticated)
            {
                return false;
            }
            if (permission.IsNullOrWhiteSpace())
            {
                return true;
            }
            if(user == null)
            {
                return false;
            }
            if (_userPermissions != null && _userPermissions.ContainsKey(user.UserID))
            {
                return _userPermissions[user.UserID].Any(m => m.PermissionKey == permission);
            }

            _userPermissions = _userPermissions ?? new Dictionary<string, IEnumerable<Permission>>();

            List<int> roles;
            if (user.Roles != null)
            {
                roles = user.Roles.ToList(m => m.RoleID);
            }
            else
            {
                roles = UserRoleRelationService.Get(m => m.UserID == user.UserID).ToList(m => m.RoleID);
            }
            
            List<Permission> permissions = new List<Permission>();
            RoleService.Get(m => roles.Contains(m.ID) && m.Status == (int)RecordStatus.Active)
                .Each(r =>
                {
                    var pers = PermissionService.Get(m => m.RoleId == r.ID);
                    if (pers.Any())
                    {
                        permissions.AddRange(pers);
                    }
                });
            _userPermissions.Add(user.UserID, permissions);
            return permissions.Any(m => m.PermissionKey == permission);
        }
    }
}