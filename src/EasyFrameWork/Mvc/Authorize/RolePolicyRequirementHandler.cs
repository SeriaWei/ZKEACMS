using Easy.Modules.Role;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Easy.Extend;

namespace Easy.Mvc.Authorize
{
    public class RolePolicyRequirementHandler : AuthorizationHandler<RolePolicyRequirement>
    {
        protected override async Task HandleRequirementAsync(AuthorizationHandlerContext context, RolePolicyRequirement requirement)
        {
            await Task.Factory.StartNew(() =>
            {
                IAuthorizer authorizer = null;
                if (context.Resource is Microsoft.AspNetCore.Mvc.Filters.AuthorizationFilterContext mvcContext)
                {
                    authorizer = mvcContext.HttpContext.RequestServices.GetService<IAuthorizer>();
                }
                else
                {
                    authorizer = ServiceLocator.GetService<IAuthorizer>();
                }                
                if (authorizer.Authorize(requirement.Policy))
                {
                    context.Succeed(requirement);
                }
                else
                {
                    context.Fail();
                }
            });

        }
    }
}
