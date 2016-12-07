using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article
{
    public class ArticleDbContext : CMSDbContext
    {
        public DbSet<ArticleDetailWidget> ArticleDetailWidget { get; set; }
        public DbSet<ArticleListWidget> ArticleListWidget { get; set; }
        public DbSet<ArticleSummaryWidget> ArticleSummaryWidget { get; set; }
        public DbSet<ArticleTopWidget> ArticleTopWidget { get; set; }
        public DbSet<ArticleTypeWidget> ArticleTypeWidget { get; set; }
    }
}
