/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Article.Service;
using ZKEACMS.Sitemap.Models;
using Easy.Extend;
using Easy;

namespace ZKEACMS.Sitemap.Service.SiteUrlProviders
{
    public class ArticlePageSiteUrlProvider : ISiteUrlProvider
    {
        private readonly IArticleUrlService _articleUrlService;

        public ArticlePageSiteUrlProvider(IArticleUrlService articleUrlService)
        {
            _articleUrlService = articleUrlService;
        }

        public IEnumerable<SiteUrl> Get()
        {
            foreach (var item in _articleUrlService.GetAllPublicUrls())
            {
                yield return new SiteUrl
                {
                    Url = Helper.Url.ToAbsolutePath(item.Url),
                    ModifyDate = item.Article.LastUpdateDate ?? DateTime.Now,
                    Changefreq = "daily",
                    Priority = 0.5F
                };
            }
        }
    }
}
