/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Extend;

namespace Easy.Cache
{
    public class StaticCache
    {
        public class CacheObject
        {
            public bool AutoRemove { get; set; }
            public int? ExpireMinutes { get; set; }
            public DateTime LastVisit { get; set; }
            readonly object _obj;
            public CacheObject(object obj, bool autoRemove, int? expireMinutes)
            {
                _obj = obj;
                LastVisit = DateTime.Now;
                AutoRemove = autoRemove;
                ExpireMinutes = expireMinutes;
            }
            public object Get()
            {
                LastVisit = DateTime.Now;                
                return _obj;
            }
        }

        internal static Dictionary<string, CacheObject> Cache;
        static StaticCache()
        {
            Cache = new Dictionary<string, CacheObject>();
        }
        public T Get<T>(string key, Func<Signal, T> source)
        {
            lock (Cache)
            {
                if (Cache.ContainsKey(key))
                {
                    var cacheObj = Cache[key];
                    if (cacheObj.AutoRemove && (DateTime.Now - cacheObj.LastVisit).TotalMinutes > (cacheObj.ExpireMinutes ?? 30))
                    {
                        Remove(key);
                    }
                    else
                    {
                        return (T)cacheObj.Get();
                    }
                }

                var signal = new Signal(key);
                T result = source.Invoke(signal);
                Cache.Add(key, new CacheObject(result, signal.AutoRemove, signal.ExpireMinutes));
                return result;

            }
        }

        public void Remove(string key)
        {
            lock (Cache)
            {
                if (Cache.ContainsKey(key))
                {
                    Cache[key] = null;
                    Cache.Remove(key);
                }
            }
        }

        public static int Count
        {
            get { return Cache.Keys.Count; }
        }
        public void Clear()
        {
            lock (Cache)
            {
                Cache.Clear();
            }
        }
    }

    public class Signal
    {
        private static readonly Dictionary<string, List<string>> SignalRela;
        public string CacheKey { get; private set; }

        public Signal(string cacheKey)
        {
            CacheKey = cacheKey;
        }

        static Signal()
        {
            SignalRela = new Dictionary<string, List<string>>();
        }
        public bool AutoRemove { get; set; }
        public int? ExpireMinutes { get; set; }
        public void When(string signal)
        {
            lock (SignalRela)
            {
                if (SignalRela.ContainsKey(signal))
                {
                    List<string> cacheKeys = SignalRela[signal];
                    if (!cacheKeys.Contains(CacheKey))
                    {
                        cacheKeys.Add(CacheKey);
                    }
                }
                else
                {
                    SignalRela.Add(signal, new List<string> { CacheKey });
                }
            }
        }

        public static void Trigger(string signal)
        {
            lock (SignalRela)
            {
                if (SignalRela.ContainsKey(signal))
                {
                    lock (StaticCache.Cache)
                    {
                        List<string> cacheKeys = SignalRela[signal];
                        cacheKeys.Each(m =>
                        {
                            if (StaticCache.Cache.ContainsKey(m))
                            {
                                StaticCache.Cache[m] = null;
                                StaticCache.Cache.Remove(m);
                            }
                        });
                    }
                }
            }
        }
    }
}
