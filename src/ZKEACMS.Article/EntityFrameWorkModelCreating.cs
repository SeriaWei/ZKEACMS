using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article
{
    public class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ArticleEntity>();
            modelBuilder.Entity<ArticleType>();
            modelBuilder.Entity<ArticleDetailWidget>();
            modelBuilder.Entity<ArticleListWidget>();
            modelBuilder.Entity<ArticleSummaryWidget>();
            modelBuilder.Entity<ArticleTopWidget>();
            modelBuilder.Entity<ArticleTypeWidget>();
        }
    }
}
