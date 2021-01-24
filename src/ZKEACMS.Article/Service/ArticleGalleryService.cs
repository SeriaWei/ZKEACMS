/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
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
    public class ArticleGalleryService : ServiceBase<ArticleGallery>, IArticleGalleryService
    {
        private readonly IArticleService _articleService;
        public ArticleGalleryService(IApplicationContext applicationContext, CMSDbContext dbContext, IArticleService articleService)
            : base(applicationContext, dbContext)
        {
            _articleService = articleService;
        }
        public override ArticleGallery Get(params object[] primaryKey)
        {
            var gallery = base.Get(primaryKey);
            if (gallery != null)
            {
                var articleIds = gallery.Articles.Where(m => m.Article != null).Select(m => m.Article.ArticleID).ToArray();
                if (articleIds.Length > 0)
                {
                    var articles = _articleService.Get(m => articleIds.Contains(m.ID));
                    foreach (var item in gallery.Articles.Where(m => m.Article != null))
                    {
                        item.Article.Title = articles.FirstOrDefault(m => m.ID == item.Article.ArticleID)?.Title;
                    }
                }
            }
            return gallery;
        }
    }
}
