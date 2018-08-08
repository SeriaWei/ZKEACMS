using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Page;
using ZKEACMS.Sitemap.Models;

namespace ZKEACMS.Sitemap.Service
{
    public class PageSiteUrlProvider : ISiteUrlProvider
    {
        private readonly IPageService _pageService;
        public PageSiteUrlProvider(IPageService pageService)
        {
            _pageService = pageService;
        }
        public IEnumerable<SiteUrl> Get()
        {
            List<string> distinct = new List<string>();
            var pages = _pageService.Get().Where(m => m.IsPublishedPage).OrderBy(m => m.Url).ThenByDescending(m => m.PublishDate).ToList();
            foreach (var page in pages)
            {
                if (!distinct.Contains(page.Url))
                {
                    distinct.Add(page.Url);
                    yield return new SiteUrl
                    {
                        Url = page.Url.Replace("~/", "/"),
                        ModifyDate = page.PublishDate ?? DateTime.Now,
                        Changefreq = "daily",
                        Priority = 0.5F
                    };
                }

            }
        }
    }
}
