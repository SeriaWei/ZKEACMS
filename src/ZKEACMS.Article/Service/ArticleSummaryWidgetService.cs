/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleSummaryWidgetService : WidgetService<ArticleSummaryWidget, ArticleDbContext>
    {
        public ArticleSummaryWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
        }

        public override DbSet<ArticleSummaryWidget> CurrentDbSet
        {
            get
            {
                return DbContext.ArticleSummaryWidget;
            }
        }
    }
}