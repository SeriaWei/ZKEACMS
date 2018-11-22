/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.Models;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Easy.Extend;
using Microsoft.AspNetCore.Authentication;
using Easy.Mvc.Authorize;

namespace Easy.Mvc
{
    public class ApplicationContext : IApplicationContext
    {
        public ApplicationContext(IHttpContextAccessor httpContextAccessor, IHostingEnvironment hostingEnvironment)
        {
            HttpContextAccessor = httpContextAccessor;
            HostingEnvironment = hostingEnvironment;
        }
        public IHttpContextAccessor HttpContextAccessor { get; set; }
        IUser _currentUser;
        public IUser CurrentUser
        {
            get
            {
                if (_currentUser != null)
                {
                    return _currentUser;
                }
                var httpContext = HttpContextAccessor.HttpContext;
                if (httpContext != null && httpContext.User.Identity.IsAuthenticated && httpContext.User.Identity.Name.IsNotNullAndWhiteSpace())
                {
                    using (var userService = httpContext.RequestServices.GetService<IUserService>())
                    {
                        _currentUser = userService.Get(httpContext.User.Identity.Name);
                        return _currentUser;
                    }

                }
                return null;
            }
        }
        IUser _currentCustomer;
        public IUser CurrentCustomer
        {
            get
            {
                if (_currentCustomer != null)
                {
                    return _currentCustomer;
                }
                var httpContext = HttpContextAccessor.HttpContext;
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
                                _currentCustomer = userService.Get(authenticate.Result.Principal.Identity.Name);
                                return _currentCustomer;
                            }
                        }

                    }
                    catch
                    {
                        return null;
                    }
                }
                return null;
            }
        }
        public IHostingEnvironment HostingEnvironment
        {
            get;
        }
        public bool IsAuthenticated
        {
            get { return HttpContextAccessor.HttpContext.User.Identity.IsAuthenticated; }
        }
        public T As<T>() where T : class, IApplicationContext
        {
            return this as T;
        }
    }
}
