/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.Constant;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Api;
using Easy.Extend;

namespace ZKEACMS.ApiControllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AccountController : ControllerBase
    {
        public readonly IUserService _userService;

        public AccountController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpGet("GetToken")]
        public IActionResult GetToken(string UserID, string PassWord)
        {
            if (UserID.IsNullOrEmpty() || PassWord.IsNullOrEmpty()) return Unauthorized();

            var user = _userService.Login(UserID, PassWord, UserType.Administrator, Request.HttpContext.Connection.RemoteIpAddress?.ToString());
            if (user == null) return Unauthorized();

            var token = new JwtBearerTokenHelper().BuildToken(user.UserID);
            return Ok(token);
        }
    }
}
