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
using ZKEACMS.Layout;

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
            List<PositionEntry> cssFiles = new List<PositionEntry>();
            List<PositionEntry> scriptFiles = new List<PositionEntry>();
            List<HtmlDocument> documents = new List<HtmlDocument>();
            #region Decompression
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

                        DirectoryInfo dir = new DirectoryInfo(Path.Combine(themeBasePath, entry.FullName));
                        if (dir.Exists)
                        {
                            dir.Delete(true);
                        }
                        dir.Create();
                        continue;
                    }
                    string extractFilePath = Path.Combine(themeBasePath, entry.FullName);
                    if (entry.FullName.EndsWith(".css"))
                    {
                        cssFiles.Add(new PositionEntry
                        {
                            Entry = entry.FullName
                        });
                    }
                    if (entry.FullName.EndsWith(".js"))
                    {
                        scriptFiles.Add(new PositionEntry
                        {
                            Entry = entry.FullName
                        });
                    }
                    if (entry.FullName.EndsWith(".html"))
                    {
                        entry.Open();
                        HtmlDocument doc = new HtmlDocument();
                        doc.PageName = Path.GetFileName(entry.FullName).Replace(".html", string.Empty);
                        doc.Load(entry.Open());
                        documents.Add(doc);
                    }
                    else
                    {
                        entry.ExtractToFile(extractFilePath, true);
                    }
                }
            }
            #endregion

            #region Prepare Layout
            LayoutEntity layoutEntity = new LayoutEntity();

            #endregion

            foreach (var document in documents)
            {
                #region Sort css and scripts
                var links = document.DocumentNode.SelectNodes("//link");
                for (int i = 0; i < links.Count; i++)
                {
                    string href = links[i].GetAttributeValue("href", string.Empty);

                    if (href == string.Empty) continue;

                    if (href.Contains("?"))
                    {
                        href = href.Split('?')[0];
                    }
                    if (!href.EndsWith(".css")) continue;

                    foreach (var item in cssFiles)
                    {
                        if (item.Entry.EndsWith(href))
                        {
                            if (item.Position < i)
                            {
                                item.Position = i;
                            }
                            break;
                        }
                    }
                }

                var scripts = document.DocumentNode.SelectNodes("//script");
                for (int i = 0; i < scripts.Count; i++)
                {
                    string href = links[i].GetAttributeValue("src", string.Empty);

                    if (href == string.Empty) continue;

                    if (href.Contains("?"))
                    {
                        href = href.Split('?')[0];
                    }
                    if (!href.EndsWith(".js")) continue;

                    foreach (var item in scriptFiles)
                    {
                        if (item.Entry.EndsWith(href))
                        {
                            if (item.Position < i)
                            {
                                item.Position = i;
                            }
                            break;
                        }
                    }
                }
                #endregion

                #region Create Pages
                #endregion
            }

            #region Write theme.css,theme.min.css
            using (FileStream themeFilestram = new FileStream(Path.Combine(themeBasePath, themeName, "theme.min.css"), FileMode.Create))
            {
                using (StreamWriter writer = new StreamWriter(themeFilestram))
                {
                    foreach (var item in cssFiles.OrderBy(m => m.Position))
                    {
                        writer.WriteLine("@import url(\"{0}\");", item.Entry);
                    }
                }
            }
            using (FileStream themeFilestram = new FileStream(Path.Combine(themeBasePath, themeName, "theme.css"), FileMode.Create))
            {
                using (StreamWriter writer = new StreamWriter(themeFilestram))
                {
                    foreach (var item in cssFiles.OrderBy(m => m.Position))
                    {
                        writer.WriteLine("@import url(\"{0}\");", item.Entry);
                    }
                }
            }
            #endregion

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
