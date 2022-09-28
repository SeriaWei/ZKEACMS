/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using Easy;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Article.Models;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleSummaryWidgetService : WidgetService<ArticleSummaryWidget>
    {
        public ArticleSummaryWidgetService(IWidgetBasePartService widgetService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
        }

        protected override IEnumerable<string> GetImagesInWidget(WidgetBase widget)
        {
            return ParseHtmlImageUrls((widget as ArticleSummaryWidget).Summary);
        }
    }
}