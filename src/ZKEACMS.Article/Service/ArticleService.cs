/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Article.Models;
using Easy;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Article.Service
{
    public class ArticleService : ServiceBase<ArticleEntity, ArticleDbContext>, IArticleService
    {
        public ArticleService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<ArticleEntity> CurrentDbSet
        {
            get
            {
                return DbContext.Article;
            }
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