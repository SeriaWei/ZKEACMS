using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Product.Service;
using ZKEACMS.Sitemap.Models;
using Easy.Extend;

namespace ZKEACMS.Sitemap.Service.SiteUrlProviders
{
    public class ProductPageSiteUrlProvider : ISiteUrlProvider
    {
        private readonly SitemapDbContext _sitemapDbContext;
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        public ProductPageSiteUrlProvider(SitemapDbContext sitemapDbContext, IProductService productService, IProductCategoryService productCategoryService)
        {
            _sitemapDbContext = sitemapDbContext;
            _productService = productService;
            _productCategoryService = productCategoryService;
        }
        public IEnumerable<SiteUrl> Get()
        {
            List<string> excuted = new List<string>();
            foreach (var item in _sitemapDbContext.ProductListWidget.ToList())
            {
                if (!excuted.Contains(item.DetailPageUrl))
                {
                    var ids = _productCategoryService.Get(m => m.ID == item.ProductCategoryID || m.ParentID == item.ProductCategoryID).Select(m => m.ID).ToList();
                    var products = _productService.Get(m => m.IsPublish && ids.Contains(m.ProductCategoryID));
                    foreach (var product in products)
                    {
                        string post = product.Url.IsNullOrWhiteSpace() ? $"post-{product.ID}" : product.Url;
                        yield return new SiteUrl
                        {
                            Url = $"{item.DetailPageUrl.Replace("~/", "/")}/{post}.html",
                            ModifyDate = product.LastUpdateDate ?? DateTime.Now,
                            Changefreq = "weekly",
                            Priority = 0.5F
                        };
                    }
                    excuted.Add(item.DetailPageUrl);
                }
            }
        }
    }
}
