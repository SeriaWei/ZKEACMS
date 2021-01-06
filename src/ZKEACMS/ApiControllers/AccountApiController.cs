/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.Constant;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Api;
using Easy.Extend;
using ZKEACMS.Common.ViewModels;

namespace ZKEACMS.ApiControllers
{
    [ApiController]
    [Route("api/acount")]
    public class AccountApiController : ControllerBase
    {
        public readonly IUserService _userService;

        public AccountApiController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost("CreateToken")]
        public IActionResult CreateToken([FromBody] SignInViewModel model)
        {
            var user = _userService.Login(model.UserID, model.PassWord, UserType.Administrator, Request.HttpContext.Connection.RemoteIpAddress?.ToString());
            if (user == null) return Unauthorized();

            var token = new JwtBearerTokenHelper().BuildToken(user.UserID);
            return Ok(token);
        }
    }
}
