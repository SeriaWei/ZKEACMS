using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.IO;
using ZKEACMS.Theme;
using ZKEACMS.Extend;
using Easy.Extend;
using ZKEACMS.Common.Models;
using Microsoft.AspNetCore.Hosting;
using Easy.RepositoryPattern;
using Easy.Cache;
using System.IO.Compression;

namespace ZKEACMS.Common.Service
{
    public class TemplateService : ITemplateService
    {
        private readonly IThemeService _themeService;
        private readonly IWebHostEnvironment _webHostEnvironment;
        private readonly string _themeName = "themes";
        private readonly string _viewName = "Views";
        private readonly string _cshtml = "*.cshtml";
        private readonly string _templateFilesCacheKey = "TemplateFilesCacheKey";
        private readonly ICacheManager<List<TemplateFile>> _cacheMgr;
        public TemplateService(IWebHostEnvironment hostingEnvironment, IThemeService themeService, ICacheManager<List<TemplateFile>> cacheManager)
        {
            _webHostEnvironment = hostingEnvironment;
            _themeService = themeService;
            _cacheMgr = cacheManager;
        }
        public List<string> GetThemeNames()
        {
            List<string> list = new List<string>();
            var themes = _themeService.GetAllThemes();
            if (themes != null && themes.Count() > 0)
            {
                foreach (var item in themes)
                {
                    string path = _webHostEnvironment.MapWebRootPath(_themeName, item.ID);
                    if (ExtFile.ExistDirectory(path))
                    {
                        list.Add(item.ID);
                    }
                }
            }
            return list;
        }

        public TemplateFile Get(int id)
        {
            List<TemplateFile> templateFiles = GetTemplateFiles();
            var file = templateFiles.FirstOrDefault(m => m.Id == id);
            file.Content = ExtFile.ReadFile(file.Path);
            return file;
        }

        public TemplateFile GetDefaultTemplateFile(string templateName)
        {
            var theme = _themeService.GetCurrentTheme();
            string themeName = theme?.ID;
            string[] paths = new string[] { "~", _themeName, themeName, _viewName, "" };
            TemplateFile model = new TemplateFile()
            {
                ThemeName = themeName,
                RelativePath = string.Join("/", paths),
                LastUpdateTime = DateTime.Now
            };
            if (templateName.IsNotNullAndWhiteSpace())
            {
                model.RelativePath += templateName;
                model.Name = templateName;
                using (ZipArchive archive = ZipFile.OpenRead(Path.Combine(_webHostEnvironment.ContentRootPath, "Templates.zip")))
                {
                    foreach (ZipArchiveEntry entry in archive.Entries)
                    {
                        if (entry.Name == templateName)
                        {
                            using (StreamReader reader = new StreamReader(entry.Open()))
                            {
                                model.Content = reader.ReadToEnd();
                            }
                            break;
                        }
                    }
                }
            }
            return model;
        }

        public ServiceResult<TemplateFile> CreateOrUpdate(TemplateFile model)
        {
            string name = model.Name;
            string relativePath = model.RelativePath;
            ServiceResult<TemplateFile> result = new ServiceResult<TemplateFile>();
            if (name.EndsWith(_cshtml.Substring(1)))
            {
                relativePath = relativePath.TrimStart('~');
                model.Path = _webHostEnvironment.MapWebRootPath(relativePath.Split('/'));
                if (model.Id > 0)
                {
                    var old = Get(model.Id);
                    if (!old.Name.Equals(model.Name, StringComparison.InvariantCultureIgnoreCase))
                    {
                        ExtFile.DeleteFile(old.Path);
                    }
                }
                ExtFile.WriteFile(model.Path, model.Content);
                _cacheMgr.Remove(_templateFilesCacheKey);
                result.Result = GetTemplateFiles().First(m => m.Name == name);
            }
            else
            {
                result.RuleViolations.Add(new RuleViolation("Name", "文件名称格式错误"));
            }
            return result;
        }

        public void Delete(int id)
        {
            var model = Get(id);
            if (model.Name != "_ViewImports.cshtml")
            {
                ExtFile.DeleteFile(model.Path);
                _cacheMgr.Remove(_templateFilesCacheKey);
            }
        }

        public List<TemplateFile> GetTemplateFiles(Pagination p, string theme = "", string fileName = "")
        {
            List<TemplateFile> templateFiles = GetTemplateFiles();
            var files = templateFiles.ToArray().ToList();
            if (theme.IsNotNullAndWhiteSpace())
            {
                files = files.Where(m => m.ThemeName.Equals(theme, StringComparison.InvariantCultureIgnoreCase)).ToList();
            }
            if (fileName.IsNotNullAndWhiteSpace())
            {
                files = files.Where(m => m.Name.Contains(fileName)).ToList();
            }
            p.RecordCount = files.Count;
            files = files.Skip(p.PageIndex).Take(p.PageSize).ToList();
            return files;
        }

        private List<TemplateFile> GetTemplateFiles()
        {
            return _cacheMgr.GetOrAdd(_templateFilesCacheKey, key =>
            {
                var templateFiles = new List<TemplateFile>();
                List<string> themes = GetThemeNames();

                Dictionary<string, List<string>> dic = new Dictionary<string, List<string>>();
                foreach (var item in themes)
                {
                    List<string> temFiles = new List<string>();
                    string path = _webHostEnvironment.MapWebRootPath(_themeName, item, _viewName);
                    var fs = ExtFile.GetFiles(path, _cshtml);
                    if (fs != null && fs.Length > 0) temFiles.AddRange(fs);
                    dic.Add(item, temFiles);
                }

                int index = _webHostEnvironment.WebRootPath.Length;
                int id = 0;
                foreach (var d in dic)
                {
                    foreach (var item in d.Value)
                    {
                        TemplateFile file = new TemplateFile()
                        {
                            Id = ++id,
                            ThemeName = d.Key,
                            Name = Path.GetFileName(item),
                            Path = item,
                            RelativePath = GetRelativePath(item, index),
                            LastUpdateTime = File.GetLastWriteTime(item)
                        };
                        templateFiles.Add(file);
                    }
                }
                return templateFiles;
            });
        }

        private string GetRelativePath(string path, int len)
        {
            string p = path.Substring(len);
            p = p.Replace("\\", "/");
            return "~" + p;
        }
    }
}
