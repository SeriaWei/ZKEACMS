using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Easy.RepositoryPattern;
using ZKEACMS.Sitemap.Models;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Sitemap
{
    public class SitemapDbContext : DbContextBase
    {
        public SitemapDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring) : base(modelCreatings, configuring)
        {
        }

        internal DbSet<ArticleListWidget> ArticleListWidget { get; set; }
        internal DbSet<ProductListWidget> ProductListWidget { get; set; }
    }
}
