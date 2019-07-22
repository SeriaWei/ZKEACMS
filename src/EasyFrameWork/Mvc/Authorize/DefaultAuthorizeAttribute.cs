/* http://www.zkea.net/ 
 * Copyright 2019 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.Authorize
{
    public class DefaultAuthorizeAttribute : AuthorizeAttribute, IActionFilter
    {
        public const string DefaultAuthenticationScheme = "DefaultAuthenticationScheme";
        public DefaultAuthorizeAttribute()
        {
            this.AuthenticationSchemes = DefaultAuthenticationScheme;
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.User.Identity.IsAuthenticated && context.HttpContext.RequestServices.GetService<IApplicationContext>().CurrentUser == null)
            {
                context.HttpContext.SignOutAsync(AuthenticationSchemes).Wait();
                context.Result = new NotFoundResult();
            }
        }
    }
}