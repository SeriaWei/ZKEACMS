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
    public class CustomerAuthorizeAttribute : AuthorizeAttribute, IActionFilter
    {
        public const string CustomerAuthenticationScheme = "CustomerAuthenticationScheme";
        public CustomerAuthorizeAttribute()
        {
            this.AuthenticationSchemes = CustomerAuthenticationScheme;
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.User.Identity.IsAuthenticated && context.HttpContext.RequestServices.GetService<IApplicationContext>().CurrentCustomer == null)
            {
                context.HttpContext.SignOutAsync(AuthenticationSchemes).Wait();
                context.Result = new NotFoundResult();
            }
        }
    }
}
