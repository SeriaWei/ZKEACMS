/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
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
        private readonly IEnumerable<ISiteUrlProvider> _siteUrlProviders;
        private readonly IHostOptionProvider _hostOptionProvider;
        private readonly IEnumerable<IBlockUrlService> _blockUrlServices;

        public SitemapService(IEnumerable<ISiteUrlProvider> siteUrlProviders,
            IHostOptionProvider hostOptionProvider,
            IEnumerable<IBlockUrlService> blockUrlServices)
        {
            _siteUrlProviders = siteUrlProviders;
            _hostOptionProvider = hostOptionProvider;
            _blockUrlServices = blockUrlServices;
        }
        public string Get()
        {
            var host = _hostOptionProvider.GetOrigin();
            HashSet<string> blockedUrls = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            foreach (var blockUrlService in _blockUrlServices)
            {
                blockUrlService.GetAll().Each(l => blockedUrls.Add(l));
            }
            StringBuilder xmlBuilder = new StringBuilder();
            xmlBuilder.AppendLine("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">");

            foreach (var provider in _siteUrlProviders)
            {
                foreach (var item in provider.Get())
                {
                    if (blockedUrls.Contains(item.Url)) continue;

                    xmlBuilder.AppendFormat("<url><loc>{0}</loc><lastmod>{1}</lastmod><changefreq>{2}</changefreq><priority>{3}</priority></url>",
                     host + item.Url, item.ModifyDate.ToString("s"), item.Changefreq, item.Priority);
                }
            }
            xmlBuilder.AppendLine("</urlset>");
            return xmlBuilder.ToString();
        }
    }
}
