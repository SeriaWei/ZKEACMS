/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public class ArticleSummaryWidgetDataService : ServiceBase<ArticleSummaryWidget>, IArticleSummaryWidgetDataService
    {
        public ArticleSummaryWidgetDataService(IApplicationContext applicationContext, DbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public void UpdateDetailPageUrl(string oldUrl, string newUrl)
        {
            var widgets = Get(m => m.DetailLink == oldUrl || m.DetailLink.StartsWith(oldUrl + "/"));
            foreach (var item in widgets)
            {
                item.DetailLink = newUrl + item.DetailLink.Substring(oldUrl.Length);
            }
            UpdateRange(widgets.ToArray());
        }
    }
}
