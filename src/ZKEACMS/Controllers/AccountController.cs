/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Extend;
using Easy.Modules.User.Models;
using Easy.Modules.User.Service;
using Easy.Mvc.Authorize;
using ZKEACMS.Notification;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.DataProtection;
using ZKEACMS.Account;
using Microsoft.Extensions.Logging;
using Easy.Mvc.Extend;

namespace ZKEACMS.Controllers
{
    public class AccountController : Controller
    {
        private readonly IUserService _userService;
        private readonly INotifyService _notifyService;
        private readonly IDataProtectionProvider _dataProtectionProvider;
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        private readonly ILogger<AccountController> _logger;

        public AccountController(IUserService userService,
            INotifyService notifyService,
            IDataProtectionProvider dataProtectionProvider,
            ILogger<AccountController> logger,
            IApplicationContextAccessor applicationContextAccessor)
        {
            _userService = userService;
            _notifyService = notifyService;
            _dataProtectionProvider = dataProtectionProvider;
            _applicationContextAccessor = applicationContextAccessor;
            _logger = logger;
        }
        #region Admin
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(string userName, string password, string ReturnUrl)
        {
            var user = _userService.Login(userName, password, UserType.Administrator, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (user != null)
            {

                user.AuthenticationType = DefaultAuthorizeAttribute.DefaultAuthenticationScheme;
                var identity = new ClaimsIdentity(user);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                await HttpContext.SignInAsync(DefaultAuthorizeAttribute.DefaultAuthenticationScheme, new ClaimsPrincipal(identity));

                if (ReturnUrl.IsNullOrEmpty() || !Url.IsLocalUrl(ReturnUrl))
                {
                    return RedirectToAction("Index", "Dashboard");
                }
                return Redirect(ReturnUrl);
            }
            ViewBag.Errormessage = "登录失败，用户名密码不正确";
            return View();
        }

        public async Task<ActionResult> Logout(string returnurl)
        {
            await HttpContext.SignOutAsync(DefaultAuthorizeAttribute.DefaultAuthenticationScheme);
            return Redirect(returnurl ?? "~/");
        }
        #endregion

        #region Customer
        [CustomerAuthorize]
        public ActionResult Index()
        {
            return View();
        }
        [CustomerAuthorize]
        public ActionResult Edit()
        {
            return View(_applicationContextAccessor.Current.CurrentCustomer);
        }
        [HttpPost, ValidateAntiForgeryToken, CustomerAuthorize]
        public ActionResult Edit(UserEntity user)
        {
            if (_applicationContextAccessor.Current.CurrentCustomer.UserID == user.UserID)
            {
                user.UserTypeCD = (int)UserType.Customer;
                var newPhoto = Request.SaveImage();
                if (newPhoto.IsNotNullAndWhiteSpace())
                {
                    user.PhotoUrl = newPhoto;
                }
                try
                {
                    _userService.Update(user);
                }
                catch (Exception ex)
                {
                    ViewBag.Errormessage = ex.Message;
                    return View(user);
                }
            }
            return RedirectToAction("Index");
        }
        [CustomerAuthorize]
        public ActionResult PassWord()
        {
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken, CustomerAuthorize]
        public ActionResult PassWord(UserEntity user)
        {
            var logOnUser = _userService.Login(_applicationContextAccessor.Current.CurrentCustomer.UserID, user.PassWord, UserType.Customer, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (logOnUser != null)
            {
                logOnUser.PassWordNew = user.PassWordNew;
                _userService.Update(logOnUser);
                return RedirectToAction("SignOut", new { returnurl = "~/Account/SignIn" });
            }
            ViewBag.Message = "原密码错误";
            return View();
        }
        public ActionResult SignIn(string ReturnUrl)
        {
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<ActionResult> SignIn(string email, string password, string ReturnUrl)
        {
            var user = _userService.Login(email, password, UserType.Customer, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (user != null)
            {
                user.AuthenticationType = CustomerAuthorizeAttribute.CustomerAuthenticationScheme;
                var identity = new ClaimsIdentity(user);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                await HttpContext.SignInAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme, new ClaimsPrincipal(identity));

                if (ReturnUrl.IsNullOrEmpty() || !Url.IsLocalUrl(ReturnUrl))
                {
                    return RedirectToAction("Index");
                }
                return Redirect(ReturnUrl);
            }
            ViewBag.Errormessage = "登录失败，用户名密码不正确";
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }

        public async Task<ActionResult> SignOut(string returnurl)
        {
            await HttpContext.SignOutAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme);
            if (returnurl.IsNotNullAndWhiteSpace())
            {
                return Redirect(returnurl);
            }
            return RedirectToAction("SignIn");
        }
        public ActionResult SignUp(string ReturnUrl)
        {
            ViewBag.ReturnUrl = ReturnUrl;
            return View(new UserEntity());
        }
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult SignUp(UserEntity user, string ReturnUrl)
        {
            if (user.UserName.IsNotNullAndWhiteSpace() && user.PassWord.IsNotNullAndWhiteSpace() && user.Email.IsNotNullAndWhiteSpace())
            {
                try
                {
                    user.UserTypeCD = (int)UserType.Customer;
                    _userService.Add(user);
                }
                catch (Exception ex)
                {
                    ViewBag.Errormessage = ex.Message;
                    ViewBag.ReturnUrl = ReturnUrl;
                    return View(user);
                }

            }
            return RedirectToAction("SignUpSuccess", new { ReturnUrl });
        }
        public ActionResult SignUpSuccess()
        {
            return View();
        }

        public ActionResult Forgotten()
        {
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Forgotten(string Email)
        {
            if (Email.IsNotNullAndWhiteSpace())
            {
                var user = _userService.SetResetToken(Email, UserType.Customer);
                if (user != null)
                {
                    _notifyService.ResetPassword(user);
                }
                return RedirectToAction("Sended", new { to = Email, status = (user != null ? 1 : 2) });
            }
            return RedirectToAction("Forgotten");
        }

        public ActionResult Sended(string to)
        {
            ViewBag.Email = to;
            return View();
        }
        public ActionResult Reset(string token, string pt)
        {
            try
            {
                var dataProtector = _dataProtectionProvider.CreateProtector("ResetPassword");
                if (pt.IsNullOrWhiteSpace() || dataProtector.Unprotect(pt) != token)
                {
                    ViewBag.Errormessage = "访问的重置链接无效，请重新申请";
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
                ViewBag.Errormessage = "访问的重置链接无效，请重新申请";
            }
            return View(new ResetViewModel { ResetToken = token, Protect = pt });
        }
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Reset(ResetViewModel user)
        {
            try
            {
                var dataProtector = _dataProtectionProvider.CreateProtector("ResetPassword");
                if (user.Protect.IsNotNullAndWhiteSpace() && dataProtector.Unprotect(user.Protect) == user.ResetToken)
                {
                    if (_userService.ResetPassWord(user.ResetToken, user.PassWordNew))
                    {
                        return RedirectToAction("SignIn");
                    }
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            ViewBag.Errormessage = "重置密码失败";
            return View(user);
        }
        #endregion
    }
}
