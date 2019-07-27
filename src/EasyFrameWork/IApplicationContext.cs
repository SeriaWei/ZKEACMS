/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Models;
using Microsoft.AspNetCore.Hosting;
using System;

namespace Easy
{
    public interface IApplicationContext
    {
        IUser CurrentUser { get; }
        IUser CurrentCustomer { get; }
        IWebHostEnvironment HostingEnvironment { get; }
        bool IsAuthenticated { get; }
        T As<T>() where T : class, IApplicationContext;
        T Get<T>(string name);
        void Set(string name, object value);
    }
}
