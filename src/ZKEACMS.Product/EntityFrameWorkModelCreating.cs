using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product
{
    public class EntityFrameWorkModelCreating : IOnModelCreating
    {
        public void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ProductEntity>();
            modelBuilder.Entity<ProductCategory>();
            modelBuilder.Entity<ProductCategoryWidget>();
            modelBuilder.Entity<ProductDetailWidget>();
            modelBuilder.Entity<ProductListWidget>();
            modelBuilder.Entity<ProductTag>();
            modelBuilder.Entity<ProductCategoryTag>();
            modelBuilder.Entity<ProductImage>();
        }
    }
}