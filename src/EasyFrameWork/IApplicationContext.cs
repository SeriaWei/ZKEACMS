/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Models;
using System;

namespace Easy
{
    public interface IApplicationContext
    {
        IUser CurrentUser { get; }
        IServiceProvider ServiceLocator { get; }
    }
}
