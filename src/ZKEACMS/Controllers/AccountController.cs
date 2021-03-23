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
using ZKEACMS.Common.ViewModels;
using Easy;

namespace ZKEACMS.Controllers
{
    public class AccountController : Controller
    {
        private readonly IUserService _userService;
        private readonly INotifyService _notifyService;
        private readonly IDataProtectionProvider _dataProtectionProvider;
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        private readonly ILogger<AccountController> _logger;
        private readonly ILocalize _localize;

        public AccountController(IUserService userService,
            INotifyService notifyService,
            IDataProtectionProvider dataProtectionProvider,
            ILogger<AccountController> logger,
            IApplicationContextAccessor applicationContextAccessor,
            ILocalize localize)
        {
            _userService = userService;
            _notifyService = notifyService;
            _dataProtectionProvider = dataProtectionProvider;
            _applicationContextAccessor = applicationContextAccessor;
            _logger = logger;
            _localize = localize;
        }
        #region Admin
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(AdminSignViewModel model, string ReturnUrl)
        {
            if (ModelState.IsValid)
            {
                var user = _userService.Login(model.UserID, model.PassWord, UserType.Administrator, Request.HttpContext.Connection.RemoteIpAddress?.ToString());
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
                else
                {
                    ModelState.AddModelError("PassWord", _localize.Get("User name password is incorrect"));
                }
            }

            return View(model);
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
            return RedirectToAction("Index", "Account");
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
                return RedirectToAction("SignOut", "Account", new { returnurl = "~/Account/SignIn" });
            }
            ViewBag.Message = _localize.Get("Current password is not correct.");
            return View();
        }
        public ActionResult SignIn(string ReturnUrl)
        {
            ViewBag.ReturnUrl = ReturnUrl;
            return View();
        }
        [HttpPost, ValidateAntiForgeryToken]
        public async Task<ActionResult> SignIn(CustomerSignInViewModel model, string ReturnUrl)
        {
            if (ModelState.IsValid)
            {
                var user = _userService.Login(model.Email, model.PassWord, UserType.Customer, Request.HttpContext.Connection.RemoteIpAddress.ToString());
                if (user != null)
                {
                    user.AuthenticationType = CustomerAuthorizeAttribute.CustomerAuthenticationScheme;
                    var identity = new ClaimsIdentity(user);
                    identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                    await HttpContext.SignInAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme, new ClaimsPrincipal(identity));

                    if (ReturnUrl.IsNullOrEmpty() || !Url.IsLocalUrl(ReturnUrl))
                    {
                        return RedirectToAction("Index", "Account");
                    }
                    return Redirect(ReturnUrl);
                }
                else
                {
                    ModelState.AddModelError("PassWord", _localize.Get("User name password is incorrect"));
                }
            }
            ViewBag.ReturnUrl = ReturnUrl;
            return View(model);
        }

        public async Task<ActionResult> SignOut(string returnurl)
        {
            await HttpContext.SignOutAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme);
            if (returnurl.IsNotNullAndWhiteSpace())
            {
                return Redirect(returnurl);
            }
            return RedirectToAction("SignIn", "Account");
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
            return RedirectToAction("SignUpSuccess", "Account", new { ReturnUrl });
        }
        public ActionResult SignUpSuccess()
        {
            return View();
        }

        public ActionResult Forgotten(UserType? userType)
        {
            return View(new ForgottenViewModel { UserType = userType ?? UserType.Customer });
        }
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Forgotten(ForgottenViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = _userService.SetResetToken(model.Email, model.UserType);
                if (user != null)
                {
                    _notifyService.ResetPassword(user);
                }
                return RedirectToAction("Sended", "Account", new { to = model.Email, status = (user != null ? 1 : 2) });
            }
            return RedirectToAction("Forgotten", "Account");
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
                var dataProtector = GetPasswordProtector();
                if (pt.IsNullOrWhiteSpace() || dataProtector.Unprotect(pt) != token)
                {
                    ViewBag.Errormessage = _localize.Get("Invalid request");
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
                ViewBag.Errormessage = _localize.Get("Invalid request");
            }
            return View(new ResetViewModel { ResetToken = token, Protect = pt });
        }
        [HttpPost, ValidateAntiForgeryToken]
        public ActionResult Reset(ResetViewModel user)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    IDataProtector dataProtector = GetPasswordProtector();
                    if (user.Protect.IsNotNullAndWhiteSpace() && dataProtector.Unprotect(user.Protect) == user.ResetToken)
                    {
                        if (_userService.ResetPassWord(user.ResetToken, user.PassWordNew))
                        {
                            return RedirectToAction("SignIn", "Account");
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                _logger.LogError(ex.ToString());
            }
            ViewBag.Errormessage = _localize.Get("Reset password failed!");
            return View(user);
        }

        private IDataProtector GetPasswordProtector()
        {
            return _dataProtectionProvider.CreateProtector("ResetPassword");
        }
        #endregion
    }
}
