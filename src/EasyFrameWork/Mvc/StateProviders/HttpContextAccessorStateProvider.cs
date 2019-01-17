using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.StateProviders
{
    public class HttpContextAccessorStateProvider : IApplicationContextStateProvider
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public string Name => "HttpContextAccessor";

        public HttpContextAccessorStateProvider(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }

        public Func<IApplicationContext, T> Get<T>()
        {
            return context => (T)_httpContextAccessor;
        }
    }
}
