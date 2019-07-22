using System;
using System.Collections.Generic;
using System.Text;

namespace Easy.Mvc.StateProviders
{
    public interface IApplicationContextStateProvider
    {
        string Name { get; }
        Func<IApplicationContext, T> Get<T>();
    }
}
