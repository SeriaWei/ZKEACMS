using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Article.Service;
using ZKEACMS.Sitemap.Models;

namespace ZKEACMS.Sitemap.Service
{
    public class ArticlePageSiteUrlProvider : ISiteUrlProvider
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly SitemapDbContext _sitemapDbContext;
        private readonly IArticleService _articleService;
        private readonly IArticleTypeService _articleTypeService;

        public ArticlePageSiteUrlProvider(IHttpContextAccessor httpContextAccessor, SitemapDbContext sitemapDbContext, IArticleService articleService, IArticleTypeService articleTypeService)
        {
            _httpContextAccessor = httpContextAccessor;
            _sitemapDbContext = sitemapDbContext;
            _articleService = articleService;
            _articleTypeService = articleTypeService;
        }
        public IEnumerable<SiteUrl> Get()
        {
            string host = _httpContextAccessor.HttpContext.Request.Scheme + "://" + _httpContextAccessor.HttpContext.Request.Host + "/";
            List<string> excuted = new List<string>();
            foreach (var item in _sitemapDbContext.ArticleListWidget.ToList())
            {
                if (!excuted.Contains(item.DetailPageUrl))
                {
                    var ids = _articleTypeService.Get(m => m.ID == item.ArticleTypeID || m.ParentID == item.ArticleTypeID).Select(m => m.ID).ToList();
                    var articles = _articleService.Get(m => m.IsPublish && ids.Contains(m.ArticleTypeID ?? 0));
                    foreach (var article in articles)
                    {
                        yield return new SiteUrl
                        {
                            Url = item.DetailPageUrl.Replace("~/", host) + "/post-" + article.ID,
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
