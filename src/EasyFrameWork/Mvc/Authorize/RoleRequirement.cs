using Easy.Modules.Role;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.Authorize
{
    public class RoleRequirement : AuthorizationHandler<RoleRequirement>, IAuthorizationRequirement
    {
        public string Policy { get; set; }
        protected override async Task HandleRequirementAsync(AuthorizationHandlerContext context, RoleRequirement requirement)
        {
            await Task.Factory.StartNew(() =>
            {
                var serviceLocator = new ServiceLocator();
                var authorizer = serviceLocator.GetService<IAuthorizer>();
                var userService = serviceLocator.GetService<IUserService>();
                if (authorizer.Authorize(Policy, userService.Get(context.User.Identity.Name)))
                {
                    context.Succeed(requirement);
                }
                else
                {
                    context.Fail();
                }
                userService.Dispose();
            });

        }
    }
}
