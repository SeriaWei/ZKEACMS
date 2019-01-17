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
using System.Collections.Concurrent;
using System.Collections.Generic;
using Easy.Mvc.StateProviders;
using System.Linq;

namespace Easy.Mvc
{
    public class ApplicationContext : IApplicationContext
    {
        private readonly ConcurrentDictionary<string, Func<object>> _stateResolvers;
        private readonly IEnumerable<IApplicationContextStateProvider> _applicationContextStateProviders;
        public ApplicationContext(IEnumerable<IApplicationContextStateProvider> applicationContextStateProviders)
        {
            _stateResolvers = new ConcurrentDictionary<string, Func<object>>();
            _applicationContextStateProviders = applicationContextStateProviders;
        }
        public IHttpContextAccessor HttpContextAccessor
        {
            get { return Get<IHttpContextAccessor>(nameof(HttpContextAccessor)); }
            set { Set(nameof(HttpContextAccessor), value); }
        }
        public IUser CurrentUser
        {
            get
            {
                return Get<IUser>(nameof(CurrentUser));
            }
        }
        IUser _currentCustomer;
        public IUser CurrentCustomer
        {
            get
            {
                return Get<IUser>(nameof(CurrentCustomer));
            }
        }
        public IHostingEnvironment HostingEnvironment
        {
            get { return Get<IHostingEnvironment>(nameof(HostingEnvironment)); }
        }
        public bool IsAuthenticated
        {
            get { return HttpContextAccessor.HttpContext.User.Identity.IsAuthenticated; }
        }
        public T As<T>() where T : class, IApplicationContext
        {
            return this as T;
        }
        Func<object> FindResolverForState<T>(string name)
        {
            var resolver = _applicationContextStateProviders.FirstOrDefault(m => m.Name == name).Get<T>();

            if (resolver == null)
            {
                return () => default(T);
            }

            return () => resolver(this);
        }
        public T Get<T>(string name)
        {
            var provider = _stateResolvers.GetOrAdd(name, key => FindResolverForState<T>(key));
            if (provider != null)
            {
                return (T)provider();
            }
            return default(T);
        }

        public void Set(string name, object value)
        {
            if (_stateResolvers.ContainsKey(name))
            {
                _stateResolvers[name] = () => value;
            }
            else
            {
                _stateResolvers.TryAdd(name, () => value);
            }
        }
    }
}
