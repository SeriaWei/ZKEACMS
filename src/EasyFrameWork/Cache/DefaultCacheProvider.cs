/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using CacheManager.Core;
using Microsoft.AspNetCore.Http;
using System.Collections.Concurrent;

namespace Easy.Cache
{
    public class DefaultCacheProvider : ICacheProvider
    {
        private readonly ConcurrentDictionary<string, object> _allCacheManager;
        public DefaultCacheProvider()
        {
            _allCacheManager = new ConcurrentDictionary<string, object>();
        }
        public ICacheManager<T> Build<T>()
        {
            return (ICacheManager<T>)_allCacheManager.GetOrAdd(typeof(T).FullName, k =>
             {
                 return new DefaultCacheManager<T>(CacheFactory.Build<T>(setting =>
                   {
                       setting.WithDictionaryHandle(k);
                   }));
             });
        }
    }
}
