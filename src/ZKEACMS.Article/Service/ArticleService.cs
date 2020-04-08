/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Article.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Easy.Extend;
using ZKEACMS.Event;

namespace ZKEACMS.Article.Service
{
    public class ArticleService : ServiceBase<ArticleEntity, CMSDbContext>, IArticleService
    {
        private readonly ILocalize _localize;
        private readonly IEventManager _eventManager;
        public ArticleService(IApplicationContext applicationContext, 
            ILocalize localize, 
            CMSDbContext dbContext,
            IEventManager eventManager) 
            : base(applicationContext, dbContext)
        {
            _localize = localize;
            _eventManager = eventManager;
        }
        public override ServiceResult<ArticleEntity> Add(ArticleEntity item)
        {
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (GetByUrl(item.Url) != null)
                {
                    var result = new ServiceResult<ArticleEntity>();
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("URL already exists")));
                    return result;
                }
            }
            return base.Add(item);
        }
        public override ServiceResult<ArticleEntity> Update(ArticleEntity item)
        {
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (Count(m => m.Url == item.Url && m.ID != item.ID) > 0)
                {
                    var result = new ServiceResult<ArticleEntity>();
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("URL already exists")));
                    return result;
                }
            }
            return base.Update(item);
        }
        public ArticleEntity GetByUrl(string url)
        {
            return Get(m => m.Url == url).FirstOrDefault();
        }

        public ArticleEntity GetNext(ArticleEntity article)
        {
            return CurrentDbSet.Where(m => m.IsPublish && m.ArticleTypeID == article.ArticleTypeID && m.PublishDate > article.PublishDate && m.ID != article.ID).OrderBy(m => m.PublishDate).ThenBy(m => m.ID).FirstOrDefault();
        }

        public ArticleEntity GetPrev(ArticleEntity article)
        {
            return CurrentDbSet.Where(m => m.IsPublish && m.ArticleTypeID == article.ArticleTypeID && m.PublishDate < article.PublishDate && m.ID != article.ID).OrderByDescending(m => m.PublishDate).ThenByDescending(m => m.ID).FirstOrDefault();
        }

        public void IncreaseCount(ArticleEntity article)
        {
            article.Counter = (article.Counter ?? 0) + 1;
            DbContext.Attach(article);
            DbContext.Entry(article).Property(x => x.Counter).IsModified = true;
            DbContext.SaveChanges();
        }

        public void Publish(int ID)
        {
            Publish(Get(ID));
        }

        public void Publish(ArticleEntity article)
        {
            article.IsPublish = true;
            article.PublishDate = DateTime.Now;
            if (article.ID > 0)
            {
                Update(article);
                _eventManager.Trigger(Events.OnArticlePublished, article);
            }
        }
    }
}