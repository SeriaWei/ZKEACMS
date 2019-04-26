using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.TemplateImporter.Models;
using Easy;
using ZKEACMS.Theme;
using System.IO;
using System.IO.Compression;
using Microsoft.AspNetCore.Hosting;

namespace ZKEACMS.TemplateImporter.Service
{
    public class TemplateImporterService : ITemplateImporterService
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IThemeService _themeService;
        private const string ThemeFolder = "themes";
        public TemplateImporterService(IHostingEnvironment hostingEnvironment)
        {
            _hostingEnvironment = hostingEnvironment;
        }

        public ThemeEntity Import(string zipFile)
        {
            string themeBasePath = Path.Combine(_hostingEnvironment.WebRootPath, ThemeFolder);
            string themeName = null;
            List<string> css = new List<string>();
            List<string> scripts = new List<string>();
            using (ZipArchive archive = ZipFile.OpenRead(zipFile))
            {
                foreach (ZipArchiveEntry entry in archive.Entries)
                {
                    if (entry.Length == 0 && entry.Name == string.Empty && entry.FullName.EndsWith('/'))
                    {
                        if (themeName == null)
                        {
                            themeName = entry.FullName.TrimEnd('/');
                        }

                        DirectoryInfo themeDir = new DirectoryInfo(Path.Combine(themeBasePath, entry.FullName));
                        if (!themeDir.Exists)
                        {
                            themeDir.Create();
                        }
                        continue;
                    }
                    string extractFilePath = Path.Combine(themeBasePath, entry.FullName);
                    if (entry.FullName.EndsWith(".css"))
                    {
                        css.Add(entry.FullName);
                    }
                    if (entry.FullName.EndsWith(".js"))
                    {
                        scripts.Add(entry.FullName);
                    }
                    if (!entry.FullName.EndsWith(".html"))
                    {
                        entry.ExtractToFile(extractFilePath, true);
                    }
                }
            }
            using (FileStream themeFilestram = new FileStream(Path.Combine(themeBasePath, themeName, "theme.min.css"), FileMode.OpenOrCreate))
            {
                using (StreamWriter writer = new StreamWriter(themeFilestram))
                {
                    foreach (var item in css)
                    {
                        writer.WriteLine("@import url(\"{0}\");", item);
                    }
                }
            }
            using (FileStream themeFilestram = new FileStream(Path.Combine(themeBasePath, themeName, "theme.css"), FileMode.OpenOrCreate))
            {
                using (StreamWriter writer = new StreamWriter(themeFilestram))
                {
                    foreach (var item in css)
                    {
                        writer.WriteLine("@import url(\"{0}\");", item);
                    }
                }
            }

            ThemeEntity themeEntity = new ThemeEntity
            {
                ID = themeName,
                Title = themeName,
                Description = "By TemplateImporter",
                IsActived = false,
                Status = (int)Easy.Constant.RecordStatus.Active,
                Thumbnail = $"~/{ThemeFolder}/{themeName}/thumbnail.jpg",
                Url = $"~/{ThemeFolder}/{themeName}/theme.min.css",
                UrlDebugger = $"~/{ThemeFolder}/{themeName}/theme.css"
            };
            //var theme = _themeService.Get(themeEntity.ID);
            //if (theme == null)
            //{
            //    _themeService.Add(theme);
            //}
            //else
            //{
            //    _themeService.Update(theme);
            //}
            return themeEntity;
        }
    }
}
