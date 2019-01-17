using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.StateProviders
{
    public class HostingEnvironmentStateProvider : IApplicationContextStateProvider
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        public HostingEnvironmentStateProvider(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }
        public string Name => "HostingEnvironment";

        public Func<IApplicationContext, T> Get<T>()
        {
            return context => (T)_hostingEnvironment;
        }
    }
}
