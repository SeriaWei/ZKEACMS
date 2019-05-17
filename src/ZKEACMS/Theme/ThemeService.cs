/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.Linq;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy.Mvc;
using Easy.Mvc.ValueProvider;
using Easy;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Concurrent;
using Microsoft.AspNetCore.Hosting;
using System.IO;
using Easy.Cache;

namespace ZKEACMS.Theme
{
    public class ThemeService : ServiceBase<ThemeEntity, CMSDbContext>, IThemeService
    {
        class FilePathMap
        {
            public string Source { get; set; }
            public string FilePath { get; set; }
        }

        private readonly ICookie _cookie;
        private const string PreViewCookieName = "PreViewTheme";
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly ConcurrentDictionary<string, object> _cache;
        private readonly ConcurrentDictionary<string, object> _versionMap;
        private const string CurrentThemeCacheKey = "CurrentThemeCacheKey";
        private const string CurrentThemeVersionMapCacheKey = "CurrentThemeVersionMapCacheKey";

        public ThemeService(ICookie cookie,
            IHttpContextAccessor httpContextAccessor,
            IHostingEnvironment hostingEnvironment,
            IApplicationContext applicationContext,
            ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _cookie = cookie;
            _httpContextAccessor = httpContextAccessor;
            _hostingEnvironment = hostingEnvironment;
            _cache = cacheManager.GetOrAdd(CurrentThemeCacheKey, key => new ConcurrentDictionary<string, object>());
            _versionMap = cacheManager.GetOrAdd(CurrentThemeVersionMapCacheKey, key => new ConcurrentDictionary<string, object>());
        }

        public override DbSet<ThemeEntity> CurrentDbSet => DbContext.Theme;

        public override IQueryable<ThemeEntity> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public void SetPreview(string id)
        {
            _cookie.SetValue(PreViewCookieName, id, true, true);
        }

        public void CancelPreview()
        {
            _cookie.Delete(PreViewCookieName);
        }
        public override ServiceResult<ThemeEntity> Add(ThemeEntity item)
        {
            _cache.Clear();
            return base.Add(item);
        }
        public override ServiceResult<ThemeEntity> Update(ThemeEntity item)
        {
            _cache.Clear();
            return base.Update(item);
        }
        public ThemeEntity GetCurrentTheme()
        {
            var id = _cookie.GetValue<string>(PreViewCookieName);
            ThemeEntity theme = null;
            if (id.IsNotNullAndWhiteSpace() && (_httpContextAccessor.HttpContext.User?.Identity.IsAuthenticated ?? false))
            {
                theme = Get(id);
                if (theme != null)
                {
                    theme.IsPreView = true;
                    theme.UrlDebugger = VersionSource(theme.UrlDebugger);
                    theme.Url = VersionSource(theme.Url);
                }
            }
            if (theme == null)
            {
                theme = _cache.GetOrAdd(CurrentThemeCacheKey, key =>
                {
                    ThemeEntity entry = Get(m => m.IsActived == true).FirstOrDefault();
                    entry.UrlDebugger = VersionSource(entry.UrlDebugger);
                    entry.Url = VersionSource(entry.Url);
                    return entry;
                }) as ThemeEntity;
            }
            return theme;
        }


        public void ChangeTheme(string id)
        {
            if (id.IsNullOrEmpty()) return;

            var activeTheme = Get(m => m.IsActived);
            activeTheme.Each(m => m.IsActived = false);
            UpdateRange(activeTheme.ToArray());
            var theme = Get(id);
            theme.IsActived = true;
            Update(theme);

        }

        private string VersionSource(string source)
        {
            return _versionMap.GetOrAdd(source, factory =>
            {
                if ((factory.StartsWith("~/") || factory.StartsWith("/")) && factory.IndexOf("?") < 0)
                {
                    string relatePath = source.Replace("~/", "");
                    string filePath = _hostingEnvironment.WebRootPath.CombinePath(relatePath);
                    _hostingEnvironment.WebRootFileProvider.Watch(relatePath).RegisterChangeCallback(OnFileChange, new FilePathMap { Source = factory, FilePath = filePath });
                    return factory + "?v=" + File.GetLastWriteTime(filePath).ToFileTime().ToString("x");
                }
                return factory;
            }).ToString();
        }
        private void OnFileChange(object filePath)
        {
            if (filePath is FilePathMap map)
            {
                string newValue = map.Source + "?v=" + File.GetLastWriteTime(map.FilePath).ToFileTime().ToString("x");
                if (_versionMap.TryGetValue(map.Source, out object oldValue))
                {
                    _versionMap.TryUpdate(map.Source, newValue, oldValue);
                }
            }
        }
    }
}