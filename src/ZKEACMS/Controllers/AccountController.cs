/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http.Authentication;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
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
            var user = _userService.Login(userName, password, Request.HttpContext.Connection.RemoteIpAddress.ToString());
            if (user != null)
            {
                
                user.AuthenticationType= CookieAuthenticationDefaults.AuthenticationScheme;
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
    }
}
