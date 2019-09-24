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
        private readonly IWebHostEnvironment _hostingEnvironment;
        private readonly IThemeService _themeService;
        private readonly ILayoutService _layoutService;
        private readonly IPageService _pageService;
        private readonly IWidgetActivator _widgetActivator;
        private readonly IWdigetCreatorManager _widgetCreatorManager;
        private static Regex jQueryFilter = new Regex(@"^jquery(\d+|\.|-|_)*(.min)?.js$", RegexOptions.Compiled | RegexOptions.IgnoreCase);
        private static Regex BootstrapFilter = new Regex(@"^bootstrap(\d+|\.|-|_)*(.min)?.(js)$|(css)$", RegexOptions.Compiled | RegexOptions.IgnoreCase);
        private static Regex StyleUrl = new Regex(@"url\(['|""]?([A-Za-z0-9_|\.|/|-]*)['|""]?\)", RegexOptions.Compiled | RegexOptions.IgnoreCase);

        private const string ThemeFolder = "themes";
        public TemplateImporterService(IWebHostEnvironment hostingEnvironment,
            IThemeService themeService,
            ILayoutService layoutService,
            ILayoutHtmlService layoutHtmlService,
            IPageService pageService,
            IWidgetActivator widgetActivator,
            IWdigetCreatorManager widgetCreatorManager)
        {
            _hostingEnvironment = hostingEnvironment;
            _themeService = themeService;
            _layoutService = layoutService;
            _pageService = pageService;
            _widgetActivator = widgetActivator;
            ThemeBasePath = Path.Combine(_hostingEnvironment.WebRootPath, ThemeFolder);
            _widgetCreatorManager = widgetCreatorManager;
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
                    if (entry.FullName.StartsWith("__MACOSX/"))
                    {
                        continue;
                    }
                    if (themeName.IsNotNullAndWhiteSpace() && !entry.FullName.StartsWith(themeName))
                    {
                        new DirectoryInfo(Path.Combine(ThemeBasePath, themeName)).Delete(true);
                        throw new Exception("The package is not correct!");
                    }

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

                    if (entry.FullName.EndsWith(".html"))
                    {
                        if (entry.FullName.IndexOf('/') != entry.FullName.LastIndexOf('/'))
                        {
                            continue;
                        }
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

            #region Create Page
            int index = 1;
            foreach (var document in documents)
            {
                var page = _pageService.GetByPath($"/{document.PageName}", true);
                if (page != null)
                {
                    _pageService.Remove(page);
                }
                string title = document.PageName;
                var titleNode = document.DocumentNode.SelectSingleNode("/html/head/title");
                if (titleNode != null && titleNode.InnerText.IsNotNullAndWhiteSpace())
                {
                    title = titleNode.InnerText.Trim();
                }
                page = new PageEntity
                {
                    Title = title,
                    PageName = title,
                    ParentId = "#",
                    LayoutId = layout.ID,
                    Url = $"~/{document.PageName}".ToLower(),
                    Status = (int)Easy.Constant.RecordStatus.Active
                };
                if (document.PageName.Equals("index", StringComparison.OrdinalIgnoreCase))
                {
                    page.DisplayOrder = 1;
                }
                else
                {
                    page.DisplayOrder = ++index;
                }
                var addPageResult = _pageService.Add(page);
                if (addPageResult.HasViolation)
                {
                    throw new Exception(addPageResult.ErrorMessage);
                }
                #region Collect css
                var cssLinks = document.DocumentNode.SelectNodes("//link[@rel='stylesheet']");
                if (cssLinks != null)
                {
                    for (int i = 0; i < cssLinks.Count; i++)
                    {
                        string href = cssLinks[i].GetAttributeValue("href", string.Empty);

                        if (href == string.Empty) continue;
                        if (!isOutSidePath(href))
                        {
                            href = ConvertToThemePath(themeName, href);
                        }
                        if (!cssFiles.Any(m => m.Entry == href))
                        {
                            foreach (var item in cssFiles)
                            {
                                if (item.Position >= i)
                                {
                                    item.Position++;
                                }
                            }
                            cssFiles.Add(new PositionEntry
                            {
                                Entry = href,
                                Position = i
                            });
                        }

                    }
                }

                #endregion

                #region Collect Scripts
                StringBuilder pageScripts = new StringBuilder();
                var scripts = document.DocumentNode.SelectNodes("//script");
                if (scripts != null)
                {
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
                }
                #endregion

                #region Collect Style
                StringBuilder pageStyle = new StringBuilder();
                var innerStyles = document.DocumentNode.SelectNodes("//style");
                if (innerStyles != null)
                {
                    foreach (var item in innerStyles)
                    {
                        pageStyle.AppendLine(item.InnerText);
                    }
                }
                #endregion

                #region Url fix
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
                    string section = $"<style>{pageStyle.ToString().Trim()}</style>";
                    section = StyleUrl.Replace(section, evaluator =>
                    {
                        return $"url({ConvertToThemePath(themeName, evaluator.Groups[1].Value)})";
                    });
                    var styleWidget = _widgetCreatorManager.Create(section, themeName);
                    styleWidget.PageID = page.ID;
                    styleWidget.WidgetName = "Style";
                    styleWidget.Position = 0;
                    styleWidget.ZoneID = "ZONE-0";
                    styleWidget.StyleClass = "full";
                    _widgetActivator.Create(styleWidget).AddWidget(styleWidget);
                }
                var sections = document.DocumentNode.SelectSingleNode("/html/body").ChildNodes;
                for (int i = 0; i < sections.Count; i++)
                {
                    var node = sections[i];
                    if (node.NodeType == HtmlAgilityPack.HtmlNodeType.Element)
                    {
                        var tNode = node.SelectSingleNode(".//h1|.//h2|.//h3|.//h4|.//h5|.//h6");
                        string widgetTitle = tNode?.InnerText;

                        string section = StyleUrl.Replace(node.OuterHtml, evaluator =>
                        {
                            return $"url({ConvertToThemePath(themeName, evaluator.Groups[1].Value)})";
                        });
                        var widget = _widgetCreatorManager.Create(section, themeName);
                        widget.PageID = page.ID;
                        widget.WidgetName = (widgetTitle ?? "Html Widget").Trim();
                        widget.Position = i;
                        widget.ZoneID = "ZONE-1";
                        widget.StyleClass = "full";
                        _widgetActivator.Create(widget).AddWidget(widget);
                    }
                }
                if (pageScripts.Length > 0)
                {
                    var scriptWidget = _widgetCreatorManager.Create(pageScripts.ToString().Trim(), themeName);
                    scriptWidget.PageID = page.ID;
                    scriptWidget.WidgetName = "JavaScript";
                    scriptWidget.Position = document.DocumentNode.ChildNodes.Count;
                    scriptWidget.ZoneID = "ZONE-2";
                    scriptWidget.StyleClass = "full";
                    _widgetActivator.Create(scriptWidget).AddWidget(scriptWidget);
                }
                _pageService.Publish(page);
            }
            #endregion
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
            const string themeCss = "theme.css";
            const string themeCssMin = "theme.min.css";
            const string thumbnail = "thumbnail.jpg";
            #region Write theme.css,theme.min.css
            using (FileStream themeFilestram = new FileStream(Path.Combine(ThemeBasePath, themeName, themeCssMin), FileMode.Create))
            {
                using (StreamWriter writer = new StreamWriter(themeFilestram))
                {
                    if (cssFiles.All(css => !BootstrapFilter.IsMatch(css.Entry)))
                    {
                        writer.WriteLine("@import url(\"/lib/bootstrap/dist/css/bootstrap.min.css\");");
                    }
                    writer.WriteLine("@import url(\"/css/theme-base.css\");");
                    foreach (var item in cssFiles.OrderBy(m => m.Position))
                    {
                        writer.WriteLine("@import url(\"{0}\");", item.Entry);
                    }
                }
            }
            using (FileStream themeFilestram = new FileStream(Path.Combine(ThemeBasePath, themeName, themeCss), FileMode.Create))
            {
                using (StreamWriter writer = new StreamWriter(themeFilestram))
                {
                    if (cssFiles.All(css => !BootstrapFilter.IsMatch(css.Entry)))
                    {
                        writer.WriteLine("@import url(\"/lib/bootstrap/dist/css/bootstrap.min.css\");");
                    }
                    writer.WriteLine("@import url(\"/css/theme-base.css\");");
                    foreach (var item in cssFiles.OrderBy(m => m.Position))
                    {
                        writer.WriteLine("@import url(\"{0}\");", item.Entry);
                    }
                }
            }
            #endregion
            if (!File.Exists(Path.Combine(ThemeBasePath, themeName, thumbnail)) &&
                File.Exists(Path.Combine(ThemeBasePath, "Default", thumbnail)))
            {
                File.Copy(Path.Combine(ThemeBasePath, "Default", thumbnail), Path.Combine(ThemeBasePath, themeName, thumbnail));
            }
            ThemeEntity themeEntity = new ThemeEntity
            {
                ID = themeName,
                Title = themeName,
                Description = "By TemplateImporter",
                IsActived = false,
                Status = (int)Easy.Constant.RecordStatus.Active,
                Thumbnail = $"~/{ThemeFolder}/{themeName}/{thumbnail}",
                Url = $"~/{ThemeFolder}/{themeName}/{themeCssMin}",
                UrlDebugger = $"~/{ThemeFolder}/{themeName}/{themeCss}"
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
