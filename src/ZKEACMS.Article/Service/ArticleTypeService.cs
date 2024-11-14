/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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

        public override ErrorOr<ArticleType> Add(ArticleType item)
        {
            item.ParentID = item.ParentID ?? 0;
            if (item.Url.IsNotNullAndWhiteSpace()&& GetByUrl(item.Url) != null)
            {
                return new Error("Url", _localize.Get("URL already exists"));
            }
            return base.Add(item);
        }
        public override ErrorOr<ArticleType> Update(ArticleType item)
        {
            if (item.Url.IsNotNullAndWhiteSpace() && Count(m => m.Url == item.Url && m.ID != item.ID) > 0)
            {
                return new Error("Url", _localize.Get("URL already exists"));
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
                _articleService.Remove(n => n.ArticleTypeID == item.ID);
                GetChildren(item.ID).Each(m =>
                {
                    Remove(m);
                });                
            }
            base.Remove(item);
        }

    }
}