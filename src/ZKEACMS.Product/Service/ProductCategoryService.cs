/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.Extend;
using Easy.RepositoryPattern;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryService : ServiceBase<ProductCategory, ProductDbContext>, IProductCategoryService
    {
        private readonly IProductService _productService;
        public ProductCategoryService(IProductService productService, IApplicationContext applicationContext)
            : base(applicationContext)
        {
            _productService = productService;
        }

        public override DbSet<ProductCategory> CurrentDbSet
        {
            get
            {
                return DbContext.ProductCategory;
            }
        }

        public IEnumerable<ProductCategory> GetChildren(long id)
        {
            return Get(m => m.ParentID == id);
        }
        public override void Remove(ProductCategory item, bool saveImmediately = true)
        {
            if (item != null)
            {
                GetChildren(item.ID).Each(m =>
                {
                    _productService.Remove(n => n.ProductCategoryID == m.ID);
                    Remove(m.ID);
                });
                _productService.Remove(n => n.ProductCategoryID == item.ID);
            }
            base.Remove(item, saveImmediately);
        }
    }
}