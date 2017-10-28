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
        private readonly IPageService _pageService;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly SitemapDbContext _sitemapDbContext;
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        private readonly IArticleService _articleService;
        private readonly IArticleTypeService _articleTypeService;
        public SitemapService(IPageService pageService, IHttpContextAccessor httpContextAccessor, SitemapDbContext sitemapDbContext,
            IProductService productService,
            IProductCategoryService productCategoryService,
            IArticleService articleService,
            IArticleTypeService articleTypeService)
        {
            _pageService = pageService;
            _httpContextAccessor = httpContextAccessor;
            _sitemapDbContext = sitemapDbContext;
            _productService = productService;
            _productCategoryService = productCategoryService;
            _articleService = articleService;
            _articleTypeService = articleTypeService;
        }
        public string Get()
        {
            var pages = _pageService.Get(m => m.IsPublishedPage);
            StringBuilder xmlBuilder = new StringBuilder();
            xmlBuilder.AppendLine("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">");
            string host = _httpContextAccessor.HttpContext.Request.Scheme + "://" + _httpContextAccessor.HttpContext.Request.Host + "/";
            foreach (var page in pages)
            {
                xmlBuilder.AppendFormat("<url><loc>{0}</loc><lastmod>{1}</lastmod><changefreq>always</changefreq><priority>{2}</priority></url>",
                  page.Url.Replace("~/", host), (page.LastUpdateDate ?? DateTime.Now).ToString("yyyy-MM-ddThh:mmTZD"), page.ParentId == "#" ? "1.0" : "0.5");
            }
            List<string> excuted = new List<string>();
            foreach (var item in _sitemapDbContext.ArticleListWidget.ToList())
            {
                if (!excuted.Contains(item.DetailPageUrl))
                {
                    var ids = _articleTypeService.Get(m => m.ID == item.ArticleTypeID || m.ParentID == item.ArticleTypeID).Select(m => m.ID).ToList();                    
                    var articles = _articleService.Get(m => m.IsPublish && ids.Contains(m.ArticleTypeID ?? 0));
                    foreach (var article in articles)
                    {
                        xmlBuilder.AppendFormat("<url><loc>{0}</loc><lastmod>{1}</lastmod><changefreq>always</changefreq><priority>{2}</priority></url>",
                          item.DetailPageUrl.Replace("~/", host) + "/post-" + article.ID, (article.LastUpdateDate ?? DateTime.Now).ToString("yyyy-MM-ddThh:mmTZD"), "0.5");
                    }
                    excuted.Add(item.DetailPageUrl);
                }
            }
            foreach (var item in _sitemapDbContext.ProductListWidget.ToList())
            {
                if (!excuted.Contains(item.DetailPageUrl))
                {
                    var ids = _productCategoryService.Get(m => m.ID == item.ProductCategoryID || m.ParentID == item.ProductCategoryID).Select(m => m.ID).ToList();
                    var products = _productService.Get(m => m.IsPublish && ids.Contains(m.ProductCategoryID ?? 0));
                    foreach (var product in products)
                    {
                        xmlBuilder.AppendFormat("<url><loc>{0}</loc><lastmod>{1}</lastmod><changefreq>always</changefreq><priority>{2}</priority></url>",
                          item.DetailPageUrl.Replace("~/", host) + "/post-" + product.ID, (product.LastUpdateDate ?? DateTime.Now).ToString("yyyy-MM-ddThh:mmTZD"), "0.5");
                    }
                    excuted.Add(item.DetailPageUrl);
                }
            }
            xmlBuilder.AppendLine("</urlset>");
            return xmlBuilder.ToString();
        }
    }
}
