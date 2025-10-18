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
    public class ArticleTopWidgetDataService : ServiceBase<ArticleTopWidget>, IArticleTopWidgetDataService
    {
        public ArticleTopWidgetDataService(IApplicationContext applicationContext, DbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public void UpdateDetailPageUrl(string oldUrl, string newUrl)
        {
            var widgets = Get(m => m.DetailPageUrl == oldUrl || m.DetailPageUrl.StartsWith(oldUrl + "/") || m.MoreLink == oldUrl || m.MoreLink.StartsWith(oldUrl + "/"));
            foreach (var item in widgets)
            {
                if(item.DetailPageUrl == oldUrl || item.DetailPageUrl.StartsWith(oldUrl + "/"))
                {
                    item.DetailPageUrl = newUrl + item.DetailPageUrl.Substring(oldUrl.Length);
                }
                if(item.MoreLink == oldUrl || item.MoreLink.StartsWith(oldUrl + "/"))
                {
                    item.MoreLink = newUrl + item.MoreLink.Substring(oldUrl.Length);
                }                
            }
            UpdateRange(widgets.ToArray());
        }
    }
}
