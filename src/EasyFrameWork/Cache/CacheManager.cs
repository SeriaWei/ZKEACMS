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
    public class CacheManager<Category> : ICacheManager<Category>
    {
        private readonly IMemoryCache _memoryCache;
        private readonly ISignals _signals;
        

        public CacheManager(IMemoryCache memoryCache, ISignals signals)
        {
            _memoryCache = memoryCache;
            _signals = signals;
        }

        public T Get<T>(string key)
        {
            return _memoryCache.Get<T>(CreateCacheKey(key));
        }

        public T GetOrCreate<T>(string key, Func<ICacheEntry, T> factory)
        {
            return _memoryCache.GetOrCreate<T>(CreateCacheKey(key), cacheEntry =>
            {
                cacheEntry.AddExpirationToken(_signals.When(Signals.AllCacheEntryChanged));
                return factory(cacheEntry);
            });
        }

        public Task<T> GetOrCreateAsync<T>(string key, Func<ICacheEntry, Task<T>> factory)
        {
            return _memoryCache.GetOrCreateAsync(CreateCacheKey(key), cacheEntry =>
            {
                cacheEntry.AddExpirationToken(_signals.When(Signals.AllCacheEntryChanged));
                return factory(cacheEntry);
            });
        }

        public void Remove(string key)
        {
            _memoryCache.Remove(CreateCacheKey(key));
        }

        protected virtual string CreateCacheKey(string key)
        {
            return $"{typeof(Category).FullName}_{key}";
        }

        public void RemoveAll()
        {
            _signals.Trigger(Signals.AllCacheEntryChanged);
        }

    }
}
