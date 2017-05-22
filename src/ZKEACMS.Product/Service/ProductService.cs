/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Product.Service
{
    public class ProductService : ServiceBase<ProductEntity,ProductDbContext>, IProductService
    {
        public ProductService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<ProductEntity> CurrentDbSet
        {
            get
            {
                return DbContext.Product;
            }
        }

        public void Publish(int ID)
        {
            var product = Get(ID);
            product.IsPublish = true;
            product.PublishDate = DateTime.Now;
            Update(product);
        }
    }
}
