/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Models;
using Easy.Modules.User.Service;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc
{
    public class ApplicationContext : IApplicationContext
    {
        public ApplicationContext(IHttpContextAccessor httpContextAccessor)
        {
            HttpContextAccessor = httpContextAccessor;
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
                if (httpContext.User.Identity.IsAuthenticated)
                {
                    using (var userService = new ServiceLocator().GetService<IUserService>())
                    {
                        _currentUser = userService.Get(httpContext.User.Identity.Name);
                        return _currentUser;
                    }

                }
                return null;
            }
        }
    }
}
