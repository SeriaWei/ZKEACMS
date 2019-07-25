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

namespace ZKEACMS.Common.Service
{
    public class TemplateService : ITemplateService
    {
        private readonly IThemeService _theme;
        private readonly IWebHostEnvironment _env;
        private readonly string _themeName = "themes";
        private readonly string _viewName = "Views";
        private readonly string _cshtml = "*.cshtml";
        private readonly string _fluid = "*.fluid";
        private readonly string _templateFilesCacheKey = "TemplateFilesCacheKey";
        private readonly ICacheManager<List<TemplateFile>> _cacheMgr;
        public TemplateService(IWebHostEnvironment hostingEnvironment, IThemeService themeService, ICacheManager<List<TemplateFile>> cacheManager)
        {
            _env = hostingEnvironment;
            _theme = themeService;
            _cacheMgr = cacheManager;
        }

        public List<string> GetThemeNames()
        {
            List<string> list = new List<string>();
            var themes = _theme.GetAllThemes();
            if (themes != null && themes.Count() > 0)
            {
                foreach (var item in themes)
                {
                    string path = _env.MapWebRootPath(_themeName, item.ID);
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
            List<TemplateFile> templateFiles = _cacheMgr.GetOrAdd(_templateFilesCacheKey, key => GetTemplateFiles());
            var file = templateFiles.FirstOrDefault(m => m.Id == id);
            file.Content = ExtFile.ReadFile(file.Path);
            return file;
        }

        public TemplateFile GetDefaultTemplateFile()
        {
            var theme = _theme.GetCurrentTheme();
            string themeName = theme?.ID;
            string[] paths = new string[] { "~", _themeName, themeName, _viewName, "" };
            TemplateFile model = new TemplateFile()
            {
                ThemeName = themeName,
                RelativePath = string.Join("/", paths),
                LastUpdateTime = DateTime.Now
            };
            return model;
        }

        public string CreateOrUpdate(TemplateFile model)
        {
            string name = model.Name;
            string relativePath = model.RelativePath;
            if (relativePath.IsNullOrWhiteSpace()) return "文件相对路径错误";

            if (name.EndsWith(_cshtml.Substring(1)) || name.EndsWith(_fluid.Substring(1)))
            {
                relativePath = relativePath.TrimStart('~');
                model.Path = _env.MapWebRootPath(relativePath.Split('/'));
                if (model.Id > 0)
                {
                    var old = Get(model.Id);
                    if (!old.Name.Equals(model.Name, StringComparison.InvariantCultureIgnoreCase))
                    {
                        //model.Path = _env.MapWebRootPath(_themeName, model.ThemeName, _viewName, model.Name);
                        //model.RelativePath = GetRelativePath(model.Path, _env.WebRootPath.Length);
                        ExtFile.DeleteFile(old.Path);
                    }
                }
                ExtFile.WriteFile(model.Path, model.Content);
                _cacheMgr.Remove(_templateFilesCacheKey);
                return string.Empty;
            }
            return "文件名称格式错误";
        }

        public void Delete(int id)
        {
            var model = Get(id);
            ExtFile.DeleteFile(model.Path);
            _cacheMgr.Remove(_templateFilesCacheKey);
        }

        public List<TemplateFile> GetTemplateFiles(Pagination p, string theme = "", string fileName = "")
        {
            List<TemplateFile> templateFiles = _cacheMgr.GetOrAdd(_templateFilesCacheKey, key => GetTemplateFiles());
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
            var templateFiles = new List<TemplateFile>();
            List<string> themes = GetThemeNames();
            //if (theme.IsNullOrWhiteSpace())
            //{
            //    themes = GetThemeNames();
            //}
            //else
            //{
            //    themes = new List<string>() { theme };
            //}

            Dictionary<string, List<string>> dic = new Dictionary<string, List<string>>();
            foreach (var item in themes)
            {
                List<string> temFiles = new List<string>();
                string path = _env.MapWebRootPath(_themeName, item, _viewName);
                var fs = ExtFile.GetFiles(path, _cshtml);
                if (fs != null && fs.Length > 0) temFiles.AddRange(fs);
                var fs2 = ExtFile.GetFiles(path, _fluid);
                if (fs2 != null && fs2.Length > 0) temFiles.AddRange(fs2);
                dic.Add(item, temFiles);
            }

            int index = _env.WebRootPath.Length;
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
        }

        private string GetRelativePath(string path, int len)
        {
            string p = path.Substring(len);
            p = p.Replace("\\", "/");
            return "~" + p;
        }
    }
}
