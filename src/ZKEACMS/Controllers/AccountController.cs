/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Extend;
using Easy.Modules.User.Models;
using Easy.Modules.User.Service;
using Easy.Mvc.Authorize;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Security.Claims;
using System.Threading.Tasks;

namespace ZKEACMS.Controllers
{
    public class AccountController : Controller
    {
        private readonly IUserService _userService;

        public AccountController(IUserService userService)
        {
            _userService = userService;
        }

        //
        // GET: /Account/

        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> Login(string userName, string password, string ReturnUrl)
        {
            var user = _userService.Login(userName, password, UserType.Administrator, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (user != null)
            {

                user.AuthenticationType = CookieAuthenticationDefaults.AuthenticationScheme;
                var identity = new ClaimsIdentity(user);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(identity));

                if (ReturnUrl.IsNullOrEmpty())
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
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return Redirect(returnurl ?? "~/");
        }

        public ActionResult SignIn()
        {
            return View();
        }
        [HttpPost]
        public async Task<ActionResult> SignIn(string userName, string password, string ReturnUrl)
        {
            var user = _userService.Login(userName, password, UserType.Customer, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (user != null)
            {
                user.AuthenticationType = CustomerAuthorizeAttribute.CustomerAuthenticationScheme;
                var identity = new ClaimsIdentity(user);
                identity.AddClaim(new Claim(ClaimTypes.Name, user.UserID));
                await HttpContext.SignInAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme, new ClaimsPrincipal(identity));

                if (ReturnUrl.IsNullOrEmpty())
                {
                    return Redirect("~/");
                }
                return Redirect(ReturnUrl);
            }
            ViewBag.Errormessage = "登录失败，用户名密码不正确";
            return View();
        }

        public ActionResult SignUp()
        {
            return View(new UserEntity());
        }
        [HttpPost]
        public ActionResult SignUp(UserEntity user)
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
                    return View(user);
                }

            }
            return RedirectToAction("SignUpSuccess");
        }
        public ActionResult SignUpSuccess()
        {
            return View();
        }

        public ActionResult Forgotten()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Forgotten(string Email)
        {
            return RedirectToAction("Sended", new { Email = Email });
        }

        public ActionResult Sended(string Email)
        {
            return View(new UserEntity { Email = Email });
        }
    }
}
