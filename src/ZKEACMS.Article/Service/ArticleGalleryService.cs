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
        public ArticleGalleryService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
    }
}
