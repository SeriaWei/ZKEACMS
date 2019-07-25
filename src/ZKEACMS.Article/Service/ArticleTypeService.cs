/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.RepositoryPattern;
using System.Collections.Generic;
using ZKEACMS.Article.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace ZKEACMS.Article.Service
{
    public class ArticleTypeService : ServiceBase<ArticleType, CMSDbContext>, IArticleTypeService
    {
        private readonly IArticleService _articleService;
        private readonly ILocalize _localize;
        public ArticleTypeService(IApplicationContext applicationContext, IArticleService articleService, ILocalize localize, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _articleService = articleService;
            _localize = localize;
        }     

        public override ServiceResult<ArticleType> Add(ArticleType item)
        {
            item.ParentID = item.ParentID ?? 0;
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (GetByUrl(item.Url) != null)
                {
                    var result = new ServiceResult<ArticleType>();
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("Url已存在")));
                    return result;
                }
            }
            return base.Add(item);
        }
        public override ServiceResult<ArticleType> Update(ArticleType item)
        {
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (Count(m => m.Url == item.Url && m.ID != item.ID) > 0)
                {
                    var result = new ServiceResult<ArticleType>();
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("Url已存在")));
                    return result;
                }
            }
            return base.Update(item);
        }
        public ArticleType GetByUrl(string url)
        {
            return Get(m => m.Url == url).FirstOrDefault();
        }

        public IEnumerable<ArticleType> GetChildren(long id)
        {
            return Get(m => m.ParentID == id);
        }
        public override void Remove(ArticleType item)
        {
            if (item != null)
            {
                GetChildren(item.ID).Each(m =>
                {
                    Remove(m);
                });
                _articleService.Remove(n => n.ArticleTypeID == item.ID);
            }
            base.Remove(item);
        }

    }
}