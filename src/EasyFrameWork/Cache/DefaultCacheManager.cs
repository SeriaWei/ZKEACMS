/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using System;

namespace Easy.Cache
{
    public class DefaultCacheManager<T> : ICacheManager<T>
    {
        private readonly CacheManager.Core.ICacheManager<T> _cacheManager;

        public DefaultCacheManager(CacheManager.Core.ICacheManager<T> cacheManager)
        {
            _cacheManager = cacheManager;
        }

        public bool Add(string key, T value)
        {
            return _cacheManager.Add(key, value);
        }

        public bool Add(string key, T value, string region)
        {
            return _cacheManager.Add(key, value, region);
        }

        public bool Exists(string key)
        {
            return _cacheManager.Exists(key);
        }

        public bool Exists(string key, string region)
        {
            return _cacheManager.Exists(key, region);
        }

        public T Get(string key)
        {
            return _cacheManager.Get(key);
        }

        public T Get(string key, string region)
        {
            return _cacheManager.Get(key, region);
        }
        public T GetOrAdd(string key, string region, Func<string, string, T> valueFactory)
        {
            return _cacheManager.GetOrAdd(key, region, valueFactory);
        }

        public T GetOrAdd(string key, Func<string, T> valueFactory)
        {
            return _cacheManager.GetOrAdd(key, valueFactory);
        }

        public T GetOrAdd(string key, string region, T value)
        {
            return _cacheManager.GetOrAdd(key, region, value);
        }

        public T GetOrAdd(string key, T value)
        {
            return _cacheManager.GetOrAdd(key, value);
        }

        public void Remove(string key)
        {
            _cacheManager.Remove(key);
        }

        public void ClearRegion(string region)
        {
            _cacheManager.ClearRegion(region);
        }
        public void Clear()
        {
            _cacheManager.Clear();
        }

    }
}
