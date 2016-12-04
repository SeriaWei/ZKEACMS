/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Article.Models;
using Easy;

namespace ZKEACMS.Article.Service
{
    public class ArticleService : ServiceBase<ArticleEntity>, IArticleService
    {
        public ArticleService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public void Publish(long ID)
        {
            var article = Get(ID);
            article.IsPublish = true;
            article.PublishDate = DateTime.Now;
            Update(article);
        }
    }
}