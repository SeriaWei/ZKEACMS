/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Cache
{
    public interface ICacheManager<out Category>
    {
        T Get<T>(string key);
        T GetOrCreate<T>(string key, Func<ICacheEntry, T> factory);
        Task<T> GetOrCreateAsync<T>(string key, Func<ICacheEntry, Task<T>> factory);
        void Remove(string key);
        void RemoveAll();
    }
}
