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
        private static ConcurrentDictionary<string, Type> ContextStateProviders;
        static ApplicationContext()
        {
            ContextStateProviders = new ConcurrentDictionary<string, Type>();
        }
        public ApplicationContext(IHttpContextAccessor httpContextAccessor)
        {
            _stateResolvers = new ConcurrentDictionary<string, Func<object>>();
            HttpContextAccessor = httpContextAccessor;
        }
        public IHttpContextAccessor HttpContextAccessor
        {
            get;
        }
        public IUser CurrentUser
        {
            get
            {
                return Get<IUser>(nameof(CurrentUser));
            }
        }
        public IUser CurrentCustomer
        {
            get
            {
                return Get<IUser>(nameof(CurrentCustomer));
            }
        }
        public IWebHostEnvironment HostingEnvironment
        {
            get { return Get<IWebHostEnvironment>(nameof(HostingEnvironment)); }
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
            IApplicationContextStateProvider matchedProvider = null;
            if (!ContextStateProviders.ContainsKey(name))
            {
                var allProviders = HttpContextAccessor.HttpContext.RequestServices.GetServices<IApplicationContextStateProvider>();
                foreach (var item in allProviders)
                {
                    if (item.Name == name)
                    {
                        matchedProvider = item;
                    }
                    ContextStateProviders.AddOrUpdate(item.Name, key => { return item.GetType(); }, (key, old) => { return item.GetType(); });
                }
            }
            if (matchedProvider == null && !ContextStateProviders.ContainsKey(name))
            {
                throw new Exception($"Cannot find IApplicationContextStateProvider for name {name}. Please regist at first, ServiceCollection.ConfigureStateProvider<{name}>()");
            }
            if (matchedProvider == null)
            {
                matchedProvider = HttpContextAccessor.HttpContext.RequestServices.GetService(ContextStateProviders[name]) as IApplicationContextStateProvider;
            }
            var resolver = matchedProvider.Get<T>();

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
