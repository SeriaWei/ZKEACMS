/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace ZKEACMS.Product.Service
{
    public class ProductService : ServiceBase<ProductEntity>, IProductService
    {
        private readonly IProductTagService _productTagService;
        private readonly IProductCategoryTagService _productCategoryTagService;
        public ProductService(IApplicationContext applicationContext, IProductTagService productTagService, IProductCategoryTagService productCategoryTagService, ProductDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productTagService = productTagService;
            _productCategoryTagService = productCategoryTagService;
        }

        public override DbSet<ProductEntity> CurrentDbSet
        {
            get
            {
                return (DbContext as ProductDbContext).Product;
            }
        }

        public void Publish(int ID)
        {
            var product = Get(ID);
            product.IsPublish = true;
            product.PublishDate = DateTime.Now;
            base.Update(product);
        }
        public override void Update(ProductEntity item, bool saveImmediately = true)
        {
            base.Update(item, saveImmediately);
            if (item.ProductTags != null)
            {
                _productTagService.Remove(m => m.ProductId == item.ID);
                foreach (var tag in item.ProductTags.Where(m => m.Selected))
                {
                    _productTagService.Add(new ProductTag { ProductId = item.ID, TagId = tag.ID });
                }
            }
        }
        public override ProductEntity Get(params object[] primaryKey)
        {
            var product = base.Get(primaryKey);
            product.ProductTags = _productCategoryTagService.Get(m => m.ProductCategoryId == product.ProductCategoryID);
            var tags = _productTagService.Get(m => m.ProductId == product.ID);
            foreach (var item in product.ProductTags)
            {
                item.Selected = tags.Any(m => m.TagId == item.ID);
            }
            return product;
        }
    }
}
