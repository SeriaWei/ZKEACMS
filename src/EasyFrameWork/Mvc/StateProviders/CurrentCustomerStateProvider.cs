using Easy.Extend;
using Easy.Models;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Authentication;
using Easy.Mvc.Authorize;

namespace Easy.Mvc.StateProviders
{
    public class CurrentCustomerStateProvider : IApplicationContextStateProvider
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public CurrentCustomerStateProvider(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }
        public string Name => "CurrentCustomer";
        IUser _currentUser;
        public Func<IApplicationContext, T> Get<T>()
        {
            return context =>
            {
                if (_currentUser != null)
                {
                    return (T)_currentUser;
                }
                var httpContext = _httpContextAccessor.HttpContext;
                if (httpContext != null)
                {
                    try
                    {
                        var authenticate = httpContext.AuthenticateAsync(CustomerAuthorizeAttribute.CustomerAuthenticationScheme);
                        authenticate.Wait();
                        if (authenticate.Result.Succeeded)
                        {
                            using (var userService = httpContext.RequestServices.GetService<IUserService>())
                            {
                                _currentUser = userService.Get(authenticate.Result.Principal.Identity.Name);
                                return (T)_currentUser;
                            }
                        }

                    }
                    catch
                    {
                        return default(T);
                    }
                }
                return default(T);
            };
        }
    }
}
