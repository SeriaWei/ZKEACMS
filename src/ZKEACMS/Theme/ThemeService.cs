/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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

        private const string _preViewCookieName = "PreViewTheme";
        private const string _currentThemeCacheKey = "CurrentThemeCacheKey";
        private readonly string _themeName = "themes";
        private readonly string _sqlName = "sql";
        private readonly string _sql = "*.sql";
        private const string _allThemeCacheKey = "AllThemeCacheKey";
        private static readonly ConcurrentDictionary<string, string> _versionMap = new();

        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly IWebHostEnvironment _hostingEnvironment;
        private readonly IApplicationSettingService _applicationSettingService;
        private readonly ICookie _cookie;
        private readonly ILogger<ThemeService> _logger;
        private readonly ICacheManager<ThemeService> _cacheManager;

        public ThemeService(ICookie cookie,
            ILogger<ThemeService> logger,
            IHttpContextAccessor httpContextAccessor,
            IWebHostEnvironment hostingEnvironment,
            IApplicationContext applicationContext,
            IApplicationSettingService applicationSettingService,
            ICacheManager<ThemeService> cacheManager,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _cookie = cookie;
            _httpContextAccessor = httpContextAccessor;
            _hostingEnvironment = hostingEnvironment;
            _applicationSettingService = applicationSettingService;
            _cacheManager = cacheManager;
            _logger = logger;
        }

        public override DbSet<ThemeEntity> CurrentDbSet => DbContext.Theme;

        public override IQueryable<ThemeEntity> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }

        public void SetPreview(string id)
        {
            var theme = GetAllThemes().FirstOrDefault(m => m.ID.Equals(id, StringComparison.OrdinalIgnoreCase)) ?? throw new Exception("Theme not found.");
            _cookie.SetValue(_preViewCookieName, theme.ID, true, true);
        }

        public void CancelPreview()
        {
            _cookie.Delete(_preViewCookieName);
        }
        public override ErrorOr<ThemeEntity> Add(ThemeEntity item)
        {
            ClearCache();
            return base.Add(item);
        }
        public override ErrorOr<ThemeEntity> Update(ThemeEntity item)
        {
            ClearCache();
            return base.Update(item);
        }
        public ThemeEntity GetCurrentTheme()
        {
            ThemeEntity theme = GetPreviewTheme();
            if (theme != null) return theme;

            theme = _cacheManager.GetOrCreate(_currentThemeCacheKey, factory =>
            {
                ThemeEntity entry = Get(m => m.IsActived == true && m.Status == (int)RecordStatus.Active).FirstOrDefault();
                if (entry == null)
                {
                    _logger.LogError("No available theme were found!");
                    entry = Get(m => m.Status == (int)RecordStatus.Active).FirstOrDefault();
                    entry.IsActived = true;
                    Update(entry);
                }
                entry.UrlDebugger = VersionSource(entry.UrlDebugger);
                entry.Url = VersionSource(entry.Url);
                return entry;
            });
            return theme;
        }

        private ThemeEntity GetPreviewTheme()
        {
            var id = _cookie.GetValue<string>(_preViewCookieName);
            if (id.IsNullOrEmpty() || !(_httpContextAccessor.HttpContext.User?.Identity.IsAuthenticated ?? false)) return null;

            var theme = Get(id);
            if (theme == null) return null;

            theme.IsPreView = true;
            theme.UrlDebugger = VersionSource(theme.UrlDebugger);
            theme.Url = VersionSource(theme.Url);
            return theme;
        }

        public IEnumerable<ThemeEntity> GetAllThemes()
        {
            int status = (int)RecordStatus.Active;
            return _cacheManager.GetOrCreate(_allThemeCacheKey, factory => Get(m => m.Status == status));
        }

        public void ChangeTheme(string id)
        {
            if (id is null)
            {
                throw new ArgumentNullException(nameof(id));
            }

            ThemeEntity currentTheme = GetCurrentTheme();
            if (currentTheme.ID == id)
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

                using var transaction = connection.BeginTransaction();
                try
                {
                    ExecuteSql(currentTheme.ID, 1, connection, transaction);//uninstall current theme
                    ExecuteSql(theme.ID, 2, connection, transaction); //install target theme
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    transaction.Rollback();
                    _logger.LogError(ex, ex.Message);
                    throw;
                }
                finally
                {
                    if (connection.State == ConnectionState.Open)
                    {
                        connection.Close();
                    }
                }

            }

            BeginTransaction(() =>
            {
                var activeTheme = Get(m => m.ID != id && m.IsActived);
                activeTheme.Each(m => m.IsActived = false);
                UpdateRange(activeTheme.ToArray());
                theme.IsActived = true;
                Update(theme);
            });
        }

        private void ExecuteSql(string themeName, int type, DbConnection dbConnection, DbTransaction dbTransaction)
        {
            string folder = type == 1 ? "uninstall" : "install";
            string path = _hostingEnvironment.MapPath(_themeName, themeName, _sqlName, folder);
            var files = ExtFile.GetFiles(path, _sql);
            if (files != null && files.Length > 0)
            {
                foreach (var item in files)
                {
                    foreach (var sql in ReadSql(item))
                    {
                        if (sql.IsNullOrWhiteSpace()) continue;
                        using var command = dbConnection.CreateCommand();
                        command.Transaction = dbTransaction;
                        command.CommandTimeout = 0;
                        command.CommandText = sql;
                        command.ExecuteNonQuery();
                    }
                }
            }
        }
        private static IEnumerable<string> ReadSql(string scriptFile)
        {
            var file = new FileInfo(scriptFile);
            var stringBuilder = new StringBuilder();
            using (var fileStream = file.OpenRead())
            {
                using var reader = new StreamReader(fileStream);
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
                if (_versionMap.TryGetValue(map.Source, out string oldValue))
                {
                    _versionMap.TryUpdate(map.Source, newValue, oldValue);
                }
            }
        }
        private void ClearCache()
        {
            _cacheManager.Remove(_currentThemeCacheKey);
            _cacheManager.Remove(_allThemeCacheKey);
        }
    }
}