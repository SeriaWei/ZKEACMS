/* 
 * http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using System.Collections.Generic;
using System.Linq;
using Easy.Constant;
using Easy.Extend;
using Easy.Modules.Role;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class RolesController : BasicController<RoleEntity, int, IRoleService>
    {
        private readonly IPermissionService _permissionService;
        public RolesController(IRoleService userService, IPermissionService permissionService)
            : base(userService)
        {
            _permissionService = permissionService;
        }
        [NonAction]
        public override ActionResult Create(RoleEntity entity)
        {
            return base.Create(entity);
        }
        [HttpPost]
        public ActionResult Create(RoleEntity entity, List<PermissionDescriptor> PermissionSet)
        {
            Service.Add(entity);
            var permissions = new List<Permission>();
            PermissionSet.Where(m => m.Checked ?? false).Each(m =>
            {
                permissions.Add(new Permission
                {
                    RoleId = entity.ID,
                    PermissionKey = m.Key,
                    Module = m.Module,
                    Title = m.Title,
                    ActionType = ActionType.Create
                });
            });
            _permissionService.AddRange(permissions.ToArray());
            return RedirectToAction("Index");
        }
        public override ActionResult Edit(int Id)
        {
            ViewBag.Permissions = _permissionService.Get(m => m.RoleId == Id).ToList();
            return base.Edit(Id);
        }
        [NonAction]
        public override ActionResult Edit(RoleEntity entity)
        {
            return base.Edit(entity);
        }
        [HttpPost]
        public ActionResult Edit(RoleEntity entity, List<PermissionDescriptor> PermissionSet)
        {
            var permissions = _permissionService.Get(m => m.RoleId == entity.ID).ToList();
            permissions.Each(m => m.ActionType = ActionType.Delete);
            PermissionSet.Where(m => m.Checked ?? false).Each(m =>
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
                        RoleId = entity.ID,
                        PermissionKey = m.Key,
                        Module = m.Module,
                        Title = m.Title,
                        ActionType = ActionType.Create
                    });
                }

            });
            Service.Update(entity);
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

            return RedirectToAction("Index");
        }
    }
}
