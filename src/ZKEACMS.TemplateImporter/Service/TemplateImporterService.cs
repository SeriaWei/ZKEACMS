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
using ZKEACMS.Zone;
using ZKEACMS.Page;
using Easy.Extend;
using System.Text;
using ZKEACMS.Widget;
using ZKEACMS.Common.Models;
using System.Text.RegularExpressions;

namespace ZKEACMS.TemplateImporter.Service
{
    public class TemplateImporterService : ITemplateImporterService
    {
        private readonly IHostingEnvironment _hostingEnvironment;
        private readonly IThemeService _themeService;
        private readonly ILayoutService _layoutService;
        private readonly IPageService _pageService;
        private readonly IWidgetActivator _widgetActivator;
        private static Regex jQueryFilter = new Regex(@"^jquery(\d+|\.|-|_)*(.min)?.js", RegexOptions.Compiled | RegexOptions.IgnoreCase);
        private static Regex BootstrapFilter = new Regex(@"^bootstrap(\d+|\.|-|_)*(.min)?.js", RegexOptions.Compiled | RegexOptions.IgnoreCase);
        private static Regex StyleUrl = new Regex(@"url\(['|""]?([A-Za-z0-9_|\.|/|-]*)['|""]?\)");
        private const string ThemeFolder = "themes";
        public TemplateImporterService(IHostingEnvironment hostingEnvironment,
            IThemeService themeService,
            ILayoutService layoutService,
            ILayoutHtmlService layoutHtmlService,
            IPageService pageService,
            IWidgetActivator widgetActivator)
        {
            _hostingEnvironment = hostingEnvironment;
            _themeService = themeService;
            _layoutService = layoutService;
            _pageService = pageService;
            _widgetActivator = widgetActivator;
            ThemeBasePath = Path.Combine(_hostingEnvironment.WebRootPath, ThemeFolder);
        }

        public string ThemeBasePath { get; private set; }

        public ThemeEntity Import(string zipFile)
        {
            string themeName = null;
            List<PositionEntry> cssFiles = new List<PositionEntry>();
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

                        DirectoryInfo dir = new DirectoryInfo(Path.Combine(ThemeBasePath, entry.FullName));
                        if (dir.Exists)
                        {
                            dir.Delete(true);
                        }
                        dir.Create();
                        continue;
                    }
                    if (themeName == null) return null;

                    string extractFilePath = Path.Combine(ThemeBasePath, entry.FullName);
                    if (entry.FullName.EndsWith(".css"))
                    {
                        cssFiles.Add(new PositionEntry
                        {
                            Entry = entry.FullName.Substring(themeName.Length + 1)
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

            LayoutEntity layout = CreateLayout(themeName);

            #region Sort css 
            foreach (var document in documents)
            {

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
            }
            #endregion

            foreach (var document in documents)
            {
                var page = _pageService.GetByPath($"/{document.PageName}", true);
                if (page != null)
                {
                    _pageService.Remove(page);
                }
                string title = document.PageName;
                var titleNode = document.DocumentNode.SelectSingleNode("/html/head/title");
                if (titleNode != null)
                {
                    title = titleNode.InnerText.Trim();
                }
                page = new PageEntity
                {
                    Title = title,
                    PageName = title,
                    ParentId = "#",
                    LayoutId = layout.ID,
                    Url = $"~/{document.PageName}",
                    Status = (int)Easy.Constant.RecordStatus.Active
                };
                _pageService.Add(page);

                #region Collect Scripts
                var scripts = document.DocumentNode.SelectNodes("//script");
                StringBuilder pageScripts = new StringBuilder();
                foreach (var item in scripts)
                {
                    string path = item.GetAttributeValue("src", string.Empty);
                    if (path.IsNotNullAndWhiteSpace() && !isOutSidePath(path))
                    {
                        item.SetAttributeValue("src", ConvertToThemePath(themeName, path));
                    }
                    string fileName = Path.GetFileName(path);
                    if (!jQueryFilter.IsMatch(fileName) && !BootstrapFilter.IsMatch(fileName))
                    {
                        pageScripts.AppendLine(item.OuterHtml.Trim());
                    }
                    item.Remove();
                }
                #endregion

                var innerStyles = document.DocumentNode.SelectNodes("//style");
                StringBuilder pageStyle = new StringBuilder();
                if (innerStyles != null)
                {
                    foreach (var item in innerStyles)
                    {
                        pageStyle.AppendLine(item.InnerText);
                    }
                }

                #region url fix
                var links = document.DocumentNode.SelectNodes("//a");
                if (links != null)
                {
                    foreach (var item in links)
                    {
                        string href = item.GetAttributeValue("href", string.Empty);
                        if (href.IsNotNullAndWhiteSpace() && !isOutSidePath(href) && !href.StartsWith('/'))
                        {
                            if (Easy.Image.ImageHelper.IsImage(Path.GetExtension(href)))
                            {
                                item.SetAttributeValue("href", ConvertToThemePath(themeName, href));
                            }
                            else
                            {
                                item.SetAttributeValue("href", $"/{href}");
                            }
                        }
                    }
                }
                var images = document.DocumentNode.SelectNodes("//img");
                if (images != null)
                {
                    foreach (var item in images)
                    {
                        string src = item.GetAttributeValue("src", string.Empty);
                        if (src.IsNotNullAndWhiteSpace() && !isOutSidePath(src))
                        {
                            item.SetAttributeValue("src", ConvertToThemePath(themeName, src));
                        }
                    }
                }
                #endregion
                if (pageStyle.Length > 0)
                {
                    StyleSheetWidget scriptWidget = new StyleSheetWidget
                    {
                        PageID = page.ID,
                        WidgetName = "Style",
                        Position = 0,
                        ZoneID = "ZONE-0",
                        AssemblyName = "ZKEACMS",
                        PartialView = "Widget.StyleSheet",
                        ServiceTypeName = "ZKEACMS.Common.Service.StyleSheetWidgetService",
                        ViewModelTypeName = "ZKEACMS.Common.Models.StyleSheetWidget",
                        StyleClass = "full",
                        StyleSheet = pageStyle.ToString().Trim()
                    };

                    _widgetActivator.Create(scriptWidget).AddWidget(scriptWidget);
                }
                var sections = document.DocumentNode.SelectSingleNode("/html/body").ChildNodes;
                for (int i = 0; i < sections.Count; i++)
                {
                    var node = sections[i];
                    if (node.NodeType == HtmlAgilityPack.HtmlNodeType.Element)
                    {
                        var tNode = node.SelectSingleNode(".//h1|.//h2|.//h3|.//h4|.//h5|.//h6");
                        string widgetTitle = tNode?.InnerText;
                        HtmlWidget widget = new HtmlWidget
                        {
                            PageID = page.ID,
                            WidgetName = (widgetTitle ?? "Html").Trim(),
                            Position = i,
                            ZoneID = "ZONE-1",
                            AssemblyName = "ZKEACMS",
                            PartialView = "Widget.HTML",
                            ServiceTypeName = "ZKEACMS.Common.Service.HtmlWidgetService",
                            ViewModelTypeName = "ZKEACMS.Common.Models.HtmlWidget",
                            StyleClass = "full",
                            HTML = node.OuterHtml
                        };
                        widget.HTML = StyleUrl.Replace(widget.HTML, evaluator =>
                        {
                            return $"url({ConvertToThemePath(themeName, evaluator.Groups[1].Value)})";
                        });
                        _widgetActivator.Create(widget).AddWidget(widget);
                    }

                }
                if (pageScripts.Length > 0)
                {
                    ScriptWidget scriptWidget = new ScriptWidget
                    {
                        PageID = page.ID,
                        WidgetName = "JavaScript",
                        Position = document.DocumentNode.ChildNodes.Count,
                        ZoneID = "ZONE-2",
                        AssemblyName = "ZKEACMS",
                        PartialView = "Widget.Script",
                        ServiceTypeName = "ZKEACMS.Common.Service.ScriptWidgetService",
                        ViewModelTypeName = "ZKEACMS.Common.Models.ScriptWidget",
                        StyleClass = "full",
                        Script = pageScripts.ToString()
                    };

                    _widgetActivator.Create(scriptWidget).AddWidget(scriptWidget);
                }
                _pageService.Publish(page);
            }

            return CreateTheme(themeName, cssFiles);
        }
        private bool isOutSidePath(string path)
        {
            return path.IndexOf("http://", StringComparison.OrdinalIgnoreCase) == 0 ||
                path.IndexOf("https://", StringComparison.OrdinalIgnoreCase) == 0 ||
                path.StartsWith("//");
        }
        private string ConvertToThemePath(string theme, string path)
        {
            return $"/{ThemeFolder}/{theme}/{path.Trim('/')}";
        }
        private LayoutEntity CreateLayout(string themeName)
        {
            LayoutEntity layoutEntity = _layoutService.Get(m => m.Title == themeName).FirstOrDefault();
            if (layoutEntity == null)
            {
                layoutEntity = new LayoutEntity
                {
                    Title = themeName,
                    LayoutName = themeName
                };
                layoutEntity.Zones = new ZoneCollection();
                layoutEntity.Html = new LayoutHtmlCollection();
                string[] zoneNames = new string[] { "Header", "Content", "Footer" };
                for (int i = 0; i < zoneNames.Length; i++)
                {
                    ZoneEntity zone = new ZoneEntity
                    {
                        ZoneName = zoneNames[i],
                        HeadingCode = $"ZONE-{i}"
                    };
                    layoutEntity.Zones.Add(zone);
                    layoutEntity.Html.Add(new LayoutHtml
                    {
                        Html = "<div class=\"main custom-style container-fluid\"><div class=\"additional row\"><div class=\"additional col-md-12\"><div class=\"colContent row\"><div class=\"additional zone\">"
                    });
                    layoutEntity.Html.Add(new LayoutHtml { Html = ZoneEntity.ZoneTag });
                    layoutEntity.Html.Add(new LayoutHtml { Html = zone.HeadingCode });
                    layoutEntity.Html.Add(new LayoutHtml { Html = ZoneEntity.ZoneEndTag });
                    layoutEntity.Html.Add(new LayoutHtml { Html = "</div></div></div></div></div>" });
                }
                _layoutService.Add(layoutEntity);
            }
            return layoutEntity;
        }
        private ThemeEntity CreateTheme(string themeName, List<PositionEntry> cssFiles)
        {
            #region Write theme.css,theme.min.css
            using (FileStream themeFilestram = new FileStream(Path.Combine(ThemeBasePath, themeName, "theme.min.css"), FileMode.Create))
            {
                using (StreamWriter writer = new StreamWriter(themeFilestram))
                {
                    foreach (var item in cssFiles.OrderBy(m => m.Position))
                    {
                        writer.WriteLine("@import url(\"{0}\");", item.Entry);
                    }
                }
            }
            using (FileStream themeFilestram = new FileStream(Path.Combine(ThemeBasePath, themeName, "theme.css"), FileMode.Create))
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

            var theme = _themeService.Get(themeEntity.ID);
            if (theme != null)
            {
                _themeService.Remove(theme);
            }
            _themeService.Add(themeEntity);
            _themeService.ChangeTheme(themeEntity.ID);
            return themeEntity;
        }
    }
}
