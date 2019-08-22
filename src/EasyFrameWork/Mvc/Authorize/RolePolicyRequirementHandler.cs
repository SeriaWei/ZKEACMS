/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
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
        private readonly IAuthorizer _authorizer;
        public RolePolicyRequirementHandler(IAuthorizer authorizer)
        {
            _authorizer = authorizer;
        }
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, RolePolicyRequirement requirement)
        {
            if (context.User.Identity.IsAuthenticated)
            {
                if (_authorizer.Authorize(requirement.Policy))
                {
                    context.Succeed(requirement);
                }
                else
                {
                    context.Fail();
                }
            }
            else
            {
                context.Fail();
            }
            return Task.CompletedTask;
        }
    }
}
