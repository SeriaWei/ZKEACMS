using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Page;
using ZKEACMS.Sitemap.Models;
using ZKEACMS.Widget;
using Easy.Extend;
using Easy;

namespace ZKEACMS.Sitemap.Service.SiteUrlProviders
{
    public class PageSiteUrlProvider : ISiteUrlProvider
    {
        private readonly IPageService _pageService;
        private readonly SitemapDbContext _sitemapDbContext;
        private readonly IWidgetBasePartService _widgetBasePartService;
        public PageSiteUrlProvider(SitemapDbContext sitemapDbContext,
            IPageService pageService,
            IWidgetBasePartService widgetBasePartService)
        {
            _sitemapDbContext = sitemapDbContext;
            _pageService = pageService;
            _widgetBasePartService = widgetBasePartService;
        }
        public IEnumerable<SiteUrl> Get()
        {
            HashSet<string> distinct = new HashSet<string>();
            var widgetIds = _sitemapDbContext.ArticleDetailWidget.ToList().Select(m => m.ID).ToArray();
            widgetIds = widgetIds.Concat(_sitemapDbContext.ProductDetailWidget.ToList().Select(m => m.ID)).ToArray();
            var pageIds = _widgetBasePartService.Get(m => widgetIds.Contains(m.ID)).Select(m => m.PageID);
            var pages = _pageService.Get().Where(m => !pageIds.Contains(m.ID) && m.IsPublishedPage).OrderBy(m => m.ReferencePageID).ThenByDescending(m => m.PublishDate).ToList();
            foreach (var page in pages)
            {
                if (page.Url.IsNotNullAndWhiteSpace() && !distinct.Contains(page.ReferencePageID))
                {
                    distinct.Add(page.ReferencePageID);
                    yield return new SiteUrl
                    {
                        Url = Helper.Url.ToAbsolutePath(page.Url),
                        ModifyDate = page.PublishDate ?? DateTime.Now,
                        Changefreq = "daily",
                        Priority = 0.5F
                    };
                }

            }
        }
    }
}
