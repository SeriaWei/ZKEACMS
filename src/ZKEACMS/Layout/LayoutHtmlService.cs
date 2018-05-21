/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using ZKEACMS.Page;

namespace ZKEACMS.Layout
{
    public class LayoutHtmlService : ServiceBase<LayoutHtml>, ILayoutHtmlService
    {
        public LayoutHtmlService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
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
        public IEnumerable<LayoutHtml> GetByLayoutID(string layoutId)
        {
            return Get().Where(m => m.LayoutId == layoutId && m.PageId == null).OrderBy(m => m.LayoutHtmlId).ToList();
        }

    }
}
