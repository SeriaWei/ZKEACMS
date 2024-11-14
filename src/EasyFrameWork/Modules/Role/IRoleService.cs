/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections.Generic;

namespace Easy.Modules.Role
{
    public interface IRoleService : IService<RoleEntity>
    {
        IList<Permission> GetPermission(int roleId);
        ErrorOr<RoleEntity> Add(RoleEntity roleEntity, List<PermissionDescriptor> permissionDescriptors);
        ErrorOr<RoleEntity> Update(RoleEntity roleEntity, List<PermissionDescriptor> permissionDescriptors);
    }
}