/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
        protected readonly IThemeService _themeService;
        protected readonly IWebHostEnvironment _webHostEnvironment;
        private const string _themeFolderName = "themes";
        private const string _viewFolderName = "Views";
        private const string _viewImportsFileName = "_ViewImports.cshtml";
        private readonly string _templateFilesCacheKey = "TemplateFilesCacheKey";
        private readonly ICacheManager<TemplateService> _cacheMgr;
        public TemplateService(IWebHostEnvironment hostingEnvironment, IThemeService themeService, ICacheManager<TemplateService> cacheManager)
        {
            _webHostEnvironment = hostingEnvironment;
            _themeService = themeService;
            _cacheMgr = cacheManager;
        }
        public virtual string[] GetAvailableTemplates()
        {
            List<string> templates = new List<string>();
            using (ZipArchive archive = ZipFile.OpenRead(Path.Combine(_webHostEnvironment.ContentRootPath, "Templates.zip")))
            {
                foreach (ZipArchiveEntry entry in archive.Entries)
                {
                    int index = entry.Name.LastIndexOf('.');
                    templates.Add(entry.Name.Substring(0, index));
                }
            }
            return templates.OrderBy(m => m).ToArray();
        }
        public virtual List<string> GetThemeNames()
        {
            List<string> list = new List<string>();
            var themes = _themeService.GetAllThemes();
            if (themes != null && themes.Count() > 0)
            {
                foreach (var item in themes)
                {
                    string path = _webHostEnvironment.MapPath(_themeFolderName, item.ID);
                    if (ExtFile.ExistDirectory(path))
                    {
                        list.Add(item.ID);
                    }
                }
            }
            return list;
        }

        protected virtual string[] GetSupportFileExtensions()
        {
            return new string[] { ".cshtml" };
        }

        public virtual TemplateFile Get(int id)
        {
            List<TemplateFile> templateFiles = GetTemplateFiles();
            var file = templateFiles.FirstOrDefault(m => m.Id == id);
            file.Content = ExtFile.ReadFile(file.Path);
            return file;
        }

        public virtual TemplateFile GetDefaultTemplateFile(string templateName)
        {
            var theme = _themeService.GetCurrentTheme();
            string themeName = theme?.ID;
            TemplateFile model = new TemplateFile
            {
                ThemeName = themeName,
                LastUpdateTime = DateTime.Now,
                ThemeViewsFolder = GetThemeViewsFolder(themeName)
            };
            if (templateName.IsNotNullAndWhiteSpace())
            {
                foreach (var extension in GetSupportFileExtensions())
                {
                    string fileName = $"{templateName}{extension}";
                    model.RelativePath = string.Join("/", "~", _themeFolderName, themeName, _viewFolderName, fileName);
                    model.Name = fileName;
                    model.Content = GetTemplateContent(fileName);
                    if (model.Content.IsNotNullAndWhiteSpace())
                    {
                        break;
                    }
                }
            }
            else
            {
                string newTemplateName = "NewTemplate" + GetSupportFileExtensions().FirstOrDefault();
                model.RelativePath = string.Join("/", "~", _themeFolderName, themeName, _viewFolderName, newTemplateName);
                model.Name = newTemplateName;
            }
            return model;
        }

        protected virtual string GetTemplateContent(string templateName)
        {
            using (ZipArchive archive = ZipFile.OpenRead(Path.Combine(_webHostEnvironment.ContentRootPath, "Templates.zip")))
            {
                foreach (ZipArchiveEntry entry in archive.Entries)
                {
                    if (entry.Name == templateName)
                    {
                        using (StreamReader reader = new StreamReader(entry.Open()))
                        {
                            return reader.ReadToEnd();
                        }
                    }
                }
            }
            return string.Empty;
        }

        public virtual ServiceResult<TemplateFile> CreateOrUpdate(TemplateFile model)
        {
            string name = model.Name;
            string relativePath = model.RelativePath;
            ServiceResult<TemplateFile> result = new ServiceResult<TemplateFile>();
            string ext = Path.GetExtension(name);
            if (GetSupportFileExtensions().Contains(ext))
            {
                relativePath = relativePath.TrimStart('~');
                model.Path = _webHostEnvironment.MapPath(relativePath.Split('/'));
                if (model.Id > 0)
                {
                    var old = Get(model.Id);
                    if (!old.Name.Equals(model.Name, StringComparison.InvariantCultureIgnoreCase))
                    {
                        ExtFile.DeleteFile(old.Path);
                    }
                }
                ExtFile.WriteFile(model.Path, model.Content);
                EnsureHasViewImports(model.Path);
                _cacheMgr.Remove(_templateFilesCacheKey);
                result.Result = GetTemplateFiles().First(m => m.RelativePath == model.RelativePath);
            }
            else
            {
                result.RuleViolations.Add(new RuleViolation("Name", "File not support"));
            }
            return result;
        }

        public void Delete(int id)
        {
            var model = Get(id);
            if (model.Name != _viewImportsFileName)
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
            return _cacheMgr.GetOrCreate(_templateFilesCacheKey, key =>
            {
                var allTemplateFiles = new List<TemplateFile>();
                List<string> themes = GetThemeNames();

                Dictionary<string, List<string>> themeTemplateFiles = new Dictionary<string, List<string>>();
                foreach (var theme in themes)
                {
                    List<string> templateFiles = new List<string>();
                    string path = _webHostEnvironment.MapPath(_themeFolderName, theme, _viewFolderName);
                    foreach (var extension in GetSupportFileExtensions())
                    {
                        var fs = ExtFile.GetFiles(path, "*" + extension);
                        if (fs != null && fs.Length > 0) templateFiles.AddRange(fs);
                    }
                    themeTemplateFiles.Add(theme, templateFiles);
                }

                int index = _webHostEnvironment.WebRootPath.Length;
                int id = 0;
                foreach (var theme in themeTemplateFiles)
                {
                    foreach (var item in theme.Value)
                    {
                        TemplateFile file = new TemplateFile
                        {
                            Id = ++id,
                            ThemeName = theme.Key,
                            ThemeViewsFolder = GetThemeViewsFolder(theme.Key),
                            Name = Path.GetFileName(item),
                            Path = item,
                            RelativePath = GetRelativePath(item, index),
                            LastUpdateTime = File.GetLastWriteTime(item)
                        };
                        allTemplateFiles.Add(file);
                    }
                }
                return allTemplateFiles;
            });
        }
        protected virtual string GetThemeViewsFolder(string themeName)
        {
            return string.Join("/", "~", _themeFolderName, themeName, _viewFolderName);
        }
        private string GetRelativePath(string path, int len)
        {
            string p = path.Substring(len);
            p = p.Replace("\\", "/");
            return "~" + p;
        }

        public static void EnsureHasViewImports(string viewPath, params string[] addtionalUsing)
        {
            if (!viewPath.EndsWith(".cshtml")) return;

            FileInfo fileInfo = new FileInfo(viewPath);
            DirectoryInfo viewsFolder = fileInfo.Directory;
            while (!viewsFolder.Name.Equals(_viewFolderName))
            {
                viewsFolder = viewsFolder.Parent;
            }
            string viewImportsFile = Path.Combine(viewsFolder.FullName, _viewImportsFileName);
            if (File.Exists(viewImportsFile)) return;

            using (FileStream fs = new FileStream(viewImportsFile, FileMode.Create, FileAccess.ReadWrite))
            {
                using (StreamWriter writer = new StreamWriter(fs, Encoding.UTF8))
                {
                    writer.WriteLine("@inherits Easy.Mvc.RazorPages.EasyRazorPage<TModel>");
                    writer.WriteLine("@using Easy.Extend");
                    writer.WriteLine("@using Easy.Mvc.Extend");
                    writer.WriteLine("@using ZKEACMS");
                    writer.WriteLine("@using ZKEACMS.Common.Service");
                    writer.WriteLine("@using ZKEACMS.Dashboard");
                    writer.WriteLine("@using ZKEACMS.DataArchived");
                    writer.WriteLine("@using ZKEACMS.ExtendField");
                    writer.WriteLine("@using ZKEACMS.Layout");
                    writer.WriteLine("@using ZKEACMS.Media");
                    writer.WriteLine("@using ZKEACMS.Page");
                    writer.WriteLine("@using ZKEACMS.Setting");
                    writer.WriteLine("@using ZKEACMS.Theme");
                    writer.WriteLine("@using ZKEACMS.Widget");
                    writer.WriteLine("@using ZKEACMS.WidgetTemplate");
                    writer.WriteLine("@using ZKEACMS.Zone");
                    writer.WriteLine("@using Easy.Constant");
                    if(addtionalUsing != null)
                    {
                        foreach (var item in addtionalUsing)
                        {
                            writer.WriteLine(item);
                        }
                    }
                    writer.WriteLine("@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers");
                    writer.WriteLine("@addTagHelper *, EasyFrameWork");
                }
            }
        }
    }
}
