/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleSummaryWidgetService : WidgetService<ArticleSummaryWidget>
    {
        public ArticleSummaryWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }     
    }
}