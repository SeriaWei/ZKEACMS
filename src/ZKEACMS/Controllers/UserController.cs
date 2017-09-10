/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.Extend;
using Easy.Modules.Role;
using Easy.Modules.User.Models;
using Easy.Modules.User.Service;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.Mvc.Extend;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class UserController : BasicController<UserEntity, string, IUserService>
    {
        public UserController(IUserService userService)
            : base(userService)
        {

        }
        public override ActionResult Create()
        {
            var entity = new UserEntity();
            entity.Status = (int)RecordStatus.Active;
            entity.Roles = new List<UserRoleRelation>();
            return View(entity);
        }
        [HttpPost]
        public override ActionResult Create(UserEntity entity)
        {
            try
            {
                entity.PhotoUrl = Request.SaveImage();
                return base.Create(entity);
            }
            catch (Exception ex)
            {
                ViewBag.Errormessage = ex.Message;
            }
            return View(entity);
        }
        [HttpPost]
        public override ActionResult Edit(UserEntity entity)
        {
            if (ModelState.IsValid)
            {

            }
            var url = Request.SaveImage();
            if (url.IsNotNullAndWhiteSpace())
            {
                entity.PhotoUrl = url;
            }
            return base.Edit(entity);
        }
    }
}
