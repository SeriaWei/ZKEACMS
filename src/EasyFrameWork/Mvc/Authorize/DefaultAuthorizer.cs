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
        private readonly IApplicationContext _applicationContext;
        private readonly IRoleService _roleService;
        private readonly IUserRoleRelationService _userRoleRelationService;
        private readonly Dictionary<string, HashSet<string>> _userPermissions;

        public DefaultAuthorizer(IApplicationContext applicationContext,
            IRoleService roleService,
            IUserRoleRelationService userRoleRelationService)
        {
            _applicationContext = applicationContext;
            _roleService = roleService;
            _userRoleRelationService = userRoleRelationService;
            _userPermissions = new Dictionary<string, HashSet<string>>();
        }
        public bool Authorize(string permission)
        {
            return Authorize(permission, _applicationContext.CurrentUser);
        }

        public bool Authorize(string permission, IUser user)
        {
            if (!_applicationContext.IsAuthenticated)
            {
                return false;
            }
            if (permission.IsNullOrWhiteSpace())
            {
                return true;
            }
            if (user == null)
            {
                return false;
            }
            if (_userPermissions.ContainsKey(user.UserID))
            {
                return _userPermissions[user.UserID].Contains(permission);
            }

            List<int> roles;
            if (user.Roles != null)
            {
                roles = user.Roles.ToList(m => m.RoleID);
            }
            else
            {
                roles = _userRoleRelationService.Get(m => m.UserID == user.UserID).ToList(m => m.RoleID);
            }

            HashSet<string> permissions = new HashSet<string>();
            _roleService.Get(m => roles.Contains(m.ID) && m.Status == (int)RecordStatus.Active)
                .Each(r =>
                {
                    var pers = _roleService.GetPermission(r.ID);
                    pers.Each(p => permissions.Add(p.PermissionKey));
                });
            _userPermissions.Add(user.UserID, permissions);
            return permissions.Contains(permission);
        }
    }
}