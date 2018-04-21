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
        public SitemapService(IEnumerable<ISiteUrlProvider> siteUrlProviders)
        {
            _siteUrlProviders = siteUrlProviders;
        }
        public string Get()
        {
            StringBuilder xmlBuilder = new StringBuilder();
            xmlBuilder.AppendLine("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:schemaLocation=\"http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd\">");
            foreach (var provider in _siteUrlProviders)
            {
                foreach (var item in provider.Get())
                {
                    xmlBuilder.AppendFormat("<url><loc>{0}</loc><lastmod>{1}</lastmod><changefreq>{2}</changefreq><priority>{3}</priority></url>",
                      item.Url, item.ModifyDate.ToString("yyyy-MM-ddThh:mmTZD"), item.Changefreq, item.Priority);
                }
            }
            xmlBuilder.AppendLine("</urlset>");
            return xmlBuilder.ToString();
        }
    }
}
