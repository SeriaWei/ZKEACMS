/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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

namespace ZKEACMS.Layout
{
    public class LayoutHtmlService : ServiceBase<LayoutHtml>, ILayoutHtmlService
    {
        private readonly ICacheManager<IEnumerable<LayoutHtml>> _cacheManager;
        public LayoutHtmlService(IApplicationContext applicationContext, ICacheManager<IEnumerable<LayoutHtml>> cacheManager, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _cacheManager = cacheManager;
        }
        public override DbSet<LayoutHtml> CurrentDbSet => (DbContext as CMSDbContext).LayoutHtml;

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
            Func<string, string, IEnumerable<LayoutHtml>> get = (key, regin) =>
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
             };
            if (page.IsPublishedPage)
            {
                return _cacheManager.GetOrAdd(page.ID, page.ReferencePageID, get);
            }
            return get(page.ID, page.ReferencePageID);
        }
        public IEnumerable<LayoutHtml> GetByLayoutID(string layoutId)
        {
            return Get().Where(m => m.LayoutId == layoutId && m.PageId == null).OrderBy(m => m.LayoutHtmlId).ToList();
        }

        public void RemoveCache(string pageId)
        {
            _cacheManager.ClearRegion(pageId);
        }

        public void ClearCache()
        {
            _cacheManager.Clear();
        }
    }
}
