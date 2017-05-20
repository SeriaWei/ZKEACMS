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
    public class RoleRequirement : AuthorizationHandler<RoleRequirement>, IAuthorizationRequirement
    {
        public string Policy { get; set; }
        protected override async Task HandleRequirementAsync(AuthorizationHandlerContext context, RoleRequirement requirement)
        {
            await Task.Factory.StartNew(() =>
            {
                var authorizer = ServiceLocator.GetService<IAuthorizer>();
                var applicationContext = ServiceLocator.GetService<IApplicationContext>();
                if (authorizer.Authorize(Policy, applicationContext.CurrentUser))
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
