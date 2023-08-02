/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using ZKEACMS.Page;
using Easy.Cache;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Caching.Memory;

namespace ZKEACMS.Layout
{
    public class LayoutHtmlService : ServiceBase<LayoutHtml, CMSDbContext>, ILayoutHtmlService
    {
        private readonly ICacheManager<LayoutHtmlService> _cacheManager;
        private readonly ISignals _signals;
        private const string LayoutHtmlChanged = "LayoutHtmlChanged";
        public LayoutHtmlService(IApplicationContext applicationContext, 
            ICacheManager<LayoutHtmlService> cacheManager, 
            CMSDbContext dbContext, 
            ISignals signals) 
            : base(applicationContext, dbContext)
        {
            _cacheManager = cacheManager;
            _signals = signals;
        }
        public override DbSet<LayoutHtml> CurrentDbSet => DbContext.LayoutHtml;

        public override IQueryable<LayoutHtml> Get()
        {
            return CurrentDbSet.AsNoTracking();
        }
        public override ServiceResult<LayoutHtml> Add(LayoutHtml item)
        {
            item.LayoutHtmlId = 0;
            return base.Add(item);
        }
        public IEnumerable<LayoutHtml> GetByPage(PageEntity page)
        {
            IEnumerable<LayoutHtml> get()
            {
                IEnumerable<LayoutHtml> html = Get().Where(m => m.PageId == page.ID).OrderBy(m => m.LayoutHtmlId).ToList();
                if (!html.Any())
                {
                    html = GetByLayoutID(page.LayoutId);
                    if (ApplicationContext.IsAuthenticated)
                    {
                        foreach (var item in html)
                        {
                            Add(new LayoutHtml { LayoutId = item.LayoutId, Html = item.Html, PageId = page.ID });
                        }
                    }
                }
                return html;
            }
            if (page.IsPublishedPage)
            {
                return _cacheManager.GetOrCreate(page.ID, factory =>
                {
                    factory.AddExpirationToken(_signals.When(LayoutHtmlChanged));
                    factory.AddExpirationToken(_signals.When(page.ID));
                    factory.AddExpirationToken(_signals.When(page.ReferencePageID));
                    return get();
                });
            }
            return get();
        }
        public IEnumerable<LayoutHtml> GetByLayoutID(string layoutId)
        {
            return Get().Where(m => m.LayoutId == layoutId && m.PageId == null).OrderBy(m => m.LayoutHtmlId).ToList();
        }

        public void RemoveCache(string pageId)
        {
            _signals.Trigger(pageId);
        }

        public void ClearCache()
        {
            _signals.Trigger(LayoutHtmlChanged);
        }
    }
}
