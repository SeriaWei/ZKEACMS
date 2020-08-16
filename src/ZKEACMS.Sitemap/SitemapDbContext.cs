/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

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
        public SitemapDbContext(DbContextOptions<SitemapDbContext> options) : base(options)
        {
        }
        internal DbSet<ArticleDetailWidget> ArticleDetailWidget { get; set; }
        internal DbSet<ProductDetailWidget> ProductDetailWidget { get; set; }
    }
}
