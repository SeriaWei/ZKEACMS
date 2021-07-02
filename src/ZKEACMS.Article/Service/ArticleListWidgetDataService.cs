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
    public class ArticleListWidgetDataService : ServiceBase<ArticleListWidget>, IArticleListWidgetDataService
    {
        public ArticleListWidgetDataService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public void UpdateDetailPageUrl(string oldUrl, string newUrl)
        {
            var widgets = Get(m => m.DetailPageUrl == oldUrl || m.DetailPageUrl.StartsWith(oldUrl + "/"));
            foreach (var item in widgets)
            {
                item.DetailPageUrl = newUrl + item.DetailPageUrl.Substring(oldUrl.Length);
            }
            UpdateRange(widgets.ToArray());
        }
    }
}
