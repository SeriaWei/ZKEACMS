/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Article.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System.Linq;

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

        public ArticleEntity GetNext(ArticleEntity article)
        {
            return CurrentDbSet.Where(m => m.IsPublish && m.ArticleTypeID == article.ArticleTypeID && m.PublishDate > article.PublishDate).OrderBy(m => m.PublishDate).ThenBy(m => m.ID).Take(1).FirstOrDefault();
        }

        public ArticleEntity GetPrev(ArticleEntity article)
        {
            return CurrentDbSet.Where(m => m.IsPublish && m.ArticleTypeID == article.ArticleTypeID && m.PublishDate < article.PublishDate).OrderByDescending(m => m.PublishDate).ThenByDescending(m => m.ID).Take(1).FirstOrDefault();
        }

        public void Publish(int ID)
        {
            var article = Get(ID);
            article.IsPublish = true;
            article.PublishDate = DateTime.Now;
            Update(article);
        }
    }
}