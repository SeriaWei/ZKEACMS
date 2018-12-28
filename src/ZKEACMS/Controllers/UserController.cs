/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

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
using ZKEACMS;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class UserController : BasicController<UserEntity, string, IUserService>
    {
        private IApplicationContextAccessor _applicationContextAccessor;
        public UserController(IUserService userService, IApplicationContextAccessor applicationContextAccessor)
            : base(userService)
        {
            _applicationContextAccessor = applicationContextAccessor;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewUser)]
        public override IActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageUser)]
        public override IActionResult Create()
        {
            var entity = new UserEntity();
            entity.Status = (int)RecordStatus.Active;
            entity.Roles = new List<UserRoleRelation>();
            return View(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUser)]
        public override IActionResult Create(UserEntity entity)
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
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageUser)]
        public override IActionResult Edit(UserEntity entity)
        {
            try
            {
                var url = Request.SaveImage();
                if (url.IsNotNullAndWhiteSpace())
                {
                    entity.PhotoUrl = url;
                }
                return base.Edit(entity);
            }
            catch (Exception ex)
            {
                ViewBag.Errormessage = ex.Message;
            }
            return View(entity);
        }

        public IActionResult PassWord()
        {
            return View();
        }
        [HttpPost]
        public IActionResult PassWord(UserEntity user)
        {
            var logOnUser = Service.Login(_applicationContextAccessor.Current.CurrentUser.UserID, user.PassWord, UserType.Administrator, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (logOnUser != null)
            {
                logOnUser.PassWordNew = user.PassWordNew;
                Service.Update(logOnUser);
                return RedirectToAction("Logout", "Account", new { returnurl = "~/Account/Login" });
            }
            ViewBag.Message = "原密码错误";
            return View();
        }
    }
}
