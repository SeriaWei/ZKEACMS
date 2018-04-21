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
        private readonly IHttpContextAccessor _httpContextAccessor;
        public PageSiteUrlProvider(IPageService pageService, IHttpContextAccessor httpContextAccessor)
        {
            _pageService = pageService;
            _httpContextAccessor = httpContextAccessor;
        }
        public IEnumerable<SiteUrl> Get()
        {
            string host = _httpContextAccessor.HttpContext.Request.Scheme + "://" + _httpContextAccessor.HttpContext.Request.Host + "/";
            var pages = _pageService.Get(m => m.IsPublishedPage);
            foreach (var page in pages)
            {
                yield return new SiteUrl
                {
                    Url = page.Url.Replace("~/", host),
                    ModifyDate = page.LastUpdateDate ?? DateTime.Now,
                    Changefreq = "daily",
                    Priority = 0.5F
                };
            }
        }
    }
}
