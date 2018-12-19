using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.Service;
using ZKEACMS.Page;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Sitemap.Service
{
    public class SitemapService : ISitemapService
    {
        private readonly SitemapDbContext _sitemapDbContext;
        private readonly IEnumerable<ISiteUrlProvider> _siteUrlProviders;
        private readonly IHttpContextAccessor _httpContextAccessor;
        public SitemapService(SitemapDbContext sitemapDbContext, IEnumerable<ISiteUrlProvider> siteUrlProviders, IHttpContextAccessor httpContextAccessor)
        {
            _sitemapDbContext = sitemapDbContext;
            _siteUrlProviders = siteUrlProviders;
            _httpContextAccessor = httpContextAccessor;
        }
        public string Get()
        {
            var host = _httpContextAccessor.HttpContext.Request.Scheme + "://" + _httpContextAccessor.HttpContext.Request.Host;
            var articleDetailPage = _sitemapDbContext.ArticleListWidget.ToList().Select(m => m.DetailPageUrl.Replace("~/", "/")).Distinct().ToList();
            var productDetailPage = _sitemapDbContext.ProductListWidget.ToList().Select(m => m.DetailPageUrl.Replace("~/", "/")).Distinct().ToList();
            StringBuilder xmlBuilder = new StringBuilder();
            xmlBuilder.AppendLine("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">");

            foreach (var provider in _siteUrlProviders)
            {
                foreach (var item in provider.Get())
                {
                    if (articleDetailPage.Contains(item.Url) || productDetailPage.Contains(item.Url)) continue;
                    xmlBuilder.AppendFormat("<url><loc>{0}</loc><lastmod>{1}</lastmod><changefreq>{2}</changefreq><priority>{3}</priority></url>",
                     host + item.Url, item.ModifyDate.ToString("yyyy-MM-dd"), item.Changefreq, item.Priority);
                }
            }
            xmlBuilder.AppendLine("</urlset>");
            return xmlBuilder.ToString();
        }
    }
}
