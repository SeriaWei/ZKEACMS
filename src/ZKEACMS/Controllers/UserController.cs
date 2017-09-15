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

        public ActionResult PassWord()
        {
            return View();
        }
        [HttpPost]
        public ActionResult PassWord(UserEntity user)
        {
            var logOnUser = Service.Login(_applicationContextAccessor.Current.CurrentUser.UserID, user.PassWord, UserType.Administrator, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (logOnUser != null)
            {
                logOnUser.PassWordNew = user.PassWordNew;
                Service.Update(logOnUser);
                return RedirectToAction("Logout", "Account", new { returnurl = "~/Account/Login" });
            }
            ViewBag.Message = "‘≠√‹¬Î¥ÌŒÛ";
            return View();
        }
    }
}
