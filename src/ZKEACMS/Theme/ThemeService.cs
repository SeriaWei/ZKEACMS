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

namespace ZKEACMS.Theme
{
    public class ThemeService : ServiceBase<ThemeEntity>, IThemeService
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
        static ConcurrentDictionary<string, string> VersionMap;

        static ThemeService()
        {
            VersionMap = new ConcurrentDictionary<string, string>();
        }

        public ThemeService(ICookie cookie,
            IHttpContextAccessor httpContextAccessor,
            IHostingEnvironment hostingEnvironment,
            IApplicationContext applicationContext,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _cookie = cookie;
            _httpContextAccessor = httpContextAccessor;
            _hostingEnvironment = hostingEnvironment;
        }

        public override DbSet<ThemeEntity> CurrentDbSet => (DbContext as CMSDbContext).Theme;

        public void SetPreview(string id)
        {
            _cookie.SetValue(PreViewCookieName, id, true, true);
        }

        public void CancelPreview()
        {
            _cookie.Delete(PreViewCookieName);
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
                }
            }
            theme = theme ?? Get(m => m.IsActived == true).FirstOrDefault();
            theme.UrlDebugger = VersionSource(theme.UrlDebugger);
            theme.Url = VersionSource(theme.Url);
            return theme;
        }


        public void ChangeTheme(string id)
        {
            if (id.IsNullOrEmpty()) return;

            var theme = Get(id);
            if (theme != null)
            {
                var otherTheme = new ThemeEntity { IsActived = false };
                var activeTheme = Get(m => m.IsActived);
                activeTheme.Each(m => m.IsActived = false);
                UpdateRange(activeTheme.ToArray());
                theme.IsActived = true;
                Update(theme);
            }
        }

        private string VersionSource(string source)
        {
            return VersionMap.GetOrAdd(source, factory =>
            {
                if ((factory.StartsWith("~/") || factory.StartsWith("/")) && factory.IndexOf("?") < 0)
                {
                    string relatePath = source.Replace("~/", "");
                    string filePath = _hostingEnvironment.WebRootPath.CombinePath(relatePath);
                    _hostingEnvironment.WebRootFileProvider.Watch(relatePath).RegisterChangeCallback(OnFileChange, new FilePathMap { Source = factory, FilePath = filePath });
                    return factory + "?v=" + File.GetLastWriteTime(filePath).ToFileTime().ToString("x");
                }
                return factory;
            });
        }
        private void OnFileChange(object filePath)
        {
            var map = filePath as FilePathMap;
            if (map != null)
            {
                string newValue = map.Source + "?v=" + File.GetLastWriteTime(map.FilePath).ToFileTime().ToString("x");
                string oldValue = null;
                if (VersionMap.TryGetValue(map.Source, out oldValue))
                {
                    VersionMap.TryUpdate(map.Source, newValue, oldValue);
                }
            }
        }
    }
}