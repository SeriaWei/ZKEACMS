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
    [DefaultAuthorize(Policy = PermissionKeys.ViewRole)]
    public class RolesController : BasicController<RoleEntity, int, IRoleService>
    {
        public RolesController(IRoleService userService)
            : base(userService)
        {
        }
        [NonAction]
        public override IActionResult Create(RoleEntity entity)
        {
            return base.Create(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageRole)]
        public IActionResult Create(RoleEntity entity, List<Easy.Modules.Role.PermissionDescriptor> PermissionSet)
        {
            var result = Service.Add(entity, PermissionSet);
            if (result.HasViolation)
            {
                foreach (var item in result.RuleViolations)
                {
                    ModelState.AddModelError(item.ParameterName, item.ErrorMessage);
                }
                return View(entity);
            }
            return RedirectToAction("Index");
        }
        public override IActionResult Edit(int Id)
        {
            ViewBag.Permissions = Service.GetPermission(Id);
            return base.Edit(Id);
        }

        [NonAction]
        public override IActionResult Edit(RoleEntity entity)
        {
            return base.Edit(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageRole)]
        public IActionResult Edit(RoleEntity entity, List<Easy.Modules.Role.PermissionDescriptor> PermissionSet)
        {
            var result = Service.Update(entity, PermissionSet);
            if (result.HasViolation)
            {
                ViewBag.Permissions = Service.GetPermission(entity.ID);
                foreach (var item in result.RuleViolations)
                {
                    ModelState.AddModelError(item.ParameterName, item.ErrorMessage);
                }
                return View(entity);
            }
            return RedirectToAction("Index");
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageRole)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
