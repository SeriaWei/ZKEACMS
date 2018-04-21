using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.RepositoryPattern;
using ZKEACMS.Sitemap.Models;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Sitemap
{
    public class SitemapDbContext : DbContext
    {
        public SitemapDbContext(IOnDatabaseConfiguring configuring)
        {
            DatabaseConfiguring = configuring;
        }
        public IOnDatabaseConfiguring DatabaseConfiguring { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (DatabaseConfiguring != null)
            {
                DatabaseConfiguring.OnConfiguring(optionsBuilder);
            }
        }
        internal DbSet<ArticleListWidget> ArticleListWidget { get; set; }
        internal DbSet<ProductListWidget> ProductListWidget { get; set; }
    }
}
