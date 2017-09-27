/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleSummaryWidgetService : WidgetService<ArticleSummaryWidget>
    {
        public ArticleSummaryWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, ArticleDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }

        public override DbSet<ArticleSummaryWidget> CurrentDbSet
        {
            get
            {
                return (DbContext as ArticleDbContext).ArticleSummaryWidget;
            }
        }
    }
}