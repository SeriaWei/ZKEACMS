using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product
{
    public class ProductDbContext : CMSDbContext
    {
        public DbSet<ProductCategoryWidget> ProductCategoryWidget { get; set; }
        public DbSet<ProductDetailWidget> ProductDetailWidget { get; set; }
        public DbSet<ProductListWidget> ProductListWidget { get; set; }
    }
}
