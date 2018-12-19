using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Article.Service;
using ZKEACMS.Sitemap.Models;
using Easy.Extend;

namespace ZKEACMS.Sitemap.Service.SiteUrlProviders
{
    public class ArticlePageSiteUrlProvider : ISiteUrlProvider
    {
        private readonly SitemapDbContext _sitemapDbContext;
        private readonly IArticleService _articleService;
        private readonly IArticleTypeService _articleTypeService;

        public ArticlePageSiteUrlProvider(SitemapDbContext sitemapDbContext, IArticleService articleService, IArticleTypeService articleTypeService)
        {
            _sitemapDbContext = sitemapDbContext;
            _articleService = articleService;
            _articleTypeService = articleTypeService;
        }
        public IEnumerable<SiteUrl> Get()
        {
            List<string> excuted = new List<string>();
            foreach (var item in _sitemapDbContext.ArticleListWidget.ToList())
            {
                if (!excuted.Contains(item.DetailPageUrl))
                {
                    var ids = _articleTypeService.Get(m => m.ID == item.ArticleTypeID || m.ParentID == item.ArticleTypeID).Select(m => m.ID).ToList();
                    var articles = _articleService.Get(m => m.IsPublish && ids.Contains(m.ArticleTypeID ?? 0));
                    foreach (var article in articles)
                    {
                        string post = article.Url.IsNullOrWhiteSpace() ? $"post-{article.ID}" : article.Url;
                        yield return new SiteUrl
                        {
                            Url = $"{item.DetailPageUrl.Replace("~/", "/")}/{post}.html",
                            ModifyDate = article.LastUpdateDate ?? DateTime.Now,
                            Changefreq = "daily",
                            Priority = 0.5F
                        };
                    }
                    excuted.Add(item.DetailPageUrl);
                }
            }
        }
    }
}
