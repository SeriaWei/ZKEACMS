/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Page;
using ZKEACMS.Sitemap.Models;
using ZKEACMS.Widget;
using Easy.Extend;
using Easy;
using ZKEACMS.Sitemap.Service;

namespace ZKEACMS.Page
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
            HashSet<string> distinct = new HashSet<string>();
            var pages = _pageService.Get().Where(m => m.IsPublishedPage).OrderBy(m => m.ReferencePageID).ThenByDescending(m => m.PublishDate).ToList();
            foreach (var page in pages)
            {
                if (page.Url.IsNotNullAndWhiteSpace() && !distinct.Contains(page.ReferencePageID))
                {
                    distinct.Add(page.ReferencePageID);
                    yield return new SiteUrl
                    {
                        Url = Helper.Url.ToAbsolutePath(page.Url),
                        ModifyDate = page.PublishDate ?? DateTime.Now,
                        Changefreq = "daily",
                        Priority = 0.5F
                    };
                }

            }
        }
    }
}
