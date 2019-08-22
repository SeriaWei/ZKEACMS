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
using Easy.Constant;
using ZKEACMS;
using System.Text;
using Microsoft.Extensions.Logging;
using System.Data;
using ZKEACMS.Setting;
using System.Data.Common;

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
        private readonly IWebHostEnvironment _hostingEnvironment;
        private readonly IApplicationSettingService _applicationSettingService;
        private readonly ConcurrentDictionary<string, object> _cache;
        private readonly ConcurrentDictionary<string, object> _versionMap;
        private const string CurrentThemeCacheKey = "CurrentThemeCacheKey";
        private const string CurrentThemeVersionMapCacheKey = "CurrentThemeVersionMapCacheKey";

        private readonly string _themeName = "themes";
        private readonly string _sqlName = "sql";
        private readonly string _sql = "*.sql";

        private readonly ILogger<ThemeService> _logger;
        private readonly ICacheManager<IEnumerable<ThemeEntity>> _cacheMgr;
        private const string AllThemeCacheKey = "AllThemeCacheKey";
        public ThemeService(ICookie cookie,
            ILogger<ThemeService> logger,
            IHttpContextAccessor httpContextAccessor,
            IWebHostEnvironment hostingEnvironment,
            IApplicationContext applicationContext,
            IApplicationSettingService applicationSettingService,
            ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            ICacheManager<IEnumerable<ThemeEntity>> cacheMgr,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _cookie = cookie;
            _httpContextAccessor = httpContextAccessor;
            _hostingEnvironment = hostingEnvironment;
            _applicationSettingService = applicationSettingService;
            _cache = cacheManager.GetOrAdd(CurrentThemeCacheKey, key => new ConcurrentDictionary<string, object>());
            _versionMap = cacheManager.GetOrAdd(CurrentThemeVersionMapCacheKey, key => new ConcurrentDictionary<string, object>());
            _cacheMgr = cacheMgr;
            _logger = logger;
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

        public IEnumerable<ThemeEntity> GetAllThemes()
        {
            int status = (int)RecordStatus.Active;
            return _cacheMgr.GetOrAdd(AllThemeCacheKey, (key) => Get(m => m.Status == status));
        }

        public void ChangeTheme(string id)
        {
            ThemeEntity currentTheme = GetCurrentTheme();
            if (id.IsNullOrEmpty() || currentTheme.ID == id)
            {
                return;
            }

            //update by roc
            var theme = Get(id);
            const string executeScriptWhenChange = "false";//Disable as default
            if (_applicationSettingService.Get(SettingKeys.ExecuteScriptWhenChangeTheme, executeScriptWhenChange) != executeScriptWhenChange)
            {
                var connection = DbContext.Database.GetDbConnection();
                if (connection.State != ConnectionState.Open)
                    connection.Open();

                using (var transaction = connection.BeginTransaction())
                {
                    try
                    {
                        ExecuteSql(currentTheme.ID, 1, connection, transaction);//uninstall current theme
                        ExecuteSql(theme.ID, 2, connection, transaction); //install target theme
                        transaction.Commit();
                    }
                    catch (Exception ex)
                    {
                        transaction.Rollback();
                        _logger.LogError(ex.Message);
                        throw ex;
                    }
                    finally
                    {
                        if (connection.State == ConnectionState.Open)
                        {
                            connection.Close();
                        }
                    }
                }

            }

            var activeTheme = Get(m => m.ID != id && m.IsActived);
            activeTheme.Each(m => m.IsActived = false);
            UpdateRange(activeTheme.ToArray());

            theme.IsActived = true;
            Update(theme);
        }

        private void ExecuteSql(string themeName, int type, DbConnection dbConnection, DbTransaction dbTransaction)
        {
            string folder = type == 1 ? "uninstall" : "install";
            string path = _hostingEnvironment.MapWebRootPath(_themeName, themeName, _sqlName, folder);
            var files = ExtFile.GetFiles(path, _sql);
            if (files != null && files.Length > 0)
            {
                foreach (var item in files)
                {
                    foreach (var sql in ReadSql(item))
                    {
                        if (sql.IsNullOrWhiteSpace()) continue;
                        using (var command = dbConnection.CreateCommand())
                        {
                            command.Transaction = dbTransaction;
                            command.CommandTimeout = 0;
                            command.CommandText = sql;
                            command.ExecuteNonQuery();
                        }
                    }
                }
            }
        }
        private IEnumerable<string> ReadSql(string scriptFile)
        {
            FileInfo file = new FileInfo(scriptFile);
            StringBuilder stringBuilder = new StringBuilder();
            using (FileStream fileStream = file.OpenRead())
            {
                using (StreamReader reader = new StreamReader(fileStream, Encoding.Unicode))
                {
                    string line = null;
                    while ((line = reader.ReadLine()) != null)
                    {
                        if (line.Equals("GO", StringComparison.OrdinalIgnoreCase))
                        {
                            if (stringBuilder.Length > 0)
                            {
                                yield return stringBuilder.ToString().Trim();
                            }
                            stringBuilder.Clear();
                        }
                        else
                        {
                            stringBuilder.AppendLine(line);
                        }
                    }
                }
            }
            if (stringBuilder.Length > 0)
            {
                yield return stringBuilder.ToString().Trim();
            }
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