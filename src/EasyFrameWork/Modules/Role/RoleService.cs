/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.RepositoryPattern;
using System.Linq;

namespace Easy.Modules.Role
{
    public class RoleService : ServiceBase<RoleEntity>, IRoleService
    {
        private readonly IPermissionService _permissionService;
        public RoleService(IPermissionService permissionService)
        {
            _permissionService = permissionService;
        }

        //public override RoleEntity Get(params object[] primaryKey)
        //{
        //    var roleEntity = base.Get(primaryKey);
        //    roleEntity.Permissions = _permissionService.Get(m => m.RoleId == roleEntity.ID).ToList();
        //    return roleEntity;
        //}

        //public override void Update(RoleEntity item)
        //{
        //    base.Update(item);
        //    if (item.Permissions != null && item.Permissions.Any())
        //    {
        //        item.Permissions.Each(m =>
        //        {
        //            switch (m.ActionType)
        //            {
        //                case Constant.ActionType.Create:
        //                    {
        //                        _permissionService.Add(m);
        //                        break;
        //                    }
        //                case Constant.ActionType.Update:
        //                    {
        //                        _permissionService.Update(m);
        //                        break;
        //                    }
        //                case Constant.ActionType.Delete:
        //                    {
        //                        _permissionService.Remove(m);
        //                        break;
        //                    }
        //            }
        //        });
        //    }
        //}
    }
}