/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

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
        public IEnumerable<LayoutHtml> GetByLayoutID(string layoutId)
        {
            return CurrentDbSet.Where(m => m.LayoutId == layoutId).OrderBy(m => m.LayoutHtmlId);
        }
    }
}
