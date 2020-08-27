/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

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
        private readonly IProductUrlService _productUrlService;

        public ProductPageSiteUrlProvider(IProductUrlService productUrlService)
        {
            _productUrlService = productUrlService;
        }

        public IEnumerable<SiteUrl> Get()
        {
            foreach (var item in _productUrlService.GetAllPublicUrls())
            {
                yield return new SiteUrl
                {
                    Url = item.Url.Replace("~/", "/"),
                    ModifyDate = item.Product.LastUpdateDate ?? DateTime.Now,
                    Changefreq = "weekly",
                    Priority = 0.5F
                };
            }
        }
    }
}
