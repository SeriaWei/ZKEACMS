using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;
using Easy.RepositoryPattern;

namespace ZKEACMS.Product
{
    public class ProductDbContext : CMSDbContext
    {
        public ProductDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring) : base(modelCreatings, configuring)
        {
        }

        internal DbSet<ProductEntity> Product { get; set; }
        internal DbSet<ProductCategory> ProductCategory { get; set; }
        internal DbSet<ProductCategoryWidget> ProductCategoryWidget { get; set; }
        internal DbSet<ProductDetailWidget> ProductDetailWidget { get; set; }
        internal DbSet<ProductListWidget> ProductListWidget { get; set; }
    }
}
