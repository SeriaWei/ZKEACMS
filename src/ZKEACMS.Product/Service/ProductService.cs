/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using Easy.Extend;
using Easy.Constant;

namespace ZKEACMS.Product.Service
{
    public class ProductService : ServiceBase<ProductEntity>, IProductService
    {
        private readonly IProductTagService _productTagService;
        private readonly IProductCategoryTagService _productCategoryTagService;
        private readonly IProductImageService _productImageService;
        public ProductService(IApplicationContext applicationContext, IProductTagService productTagService, IProductCategoryTagService productCategoryTagService, IProductImageService productImageService, ProductDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productTagService = productTagService;
            _productCategoryTagService = productCategoryTagService;
            _productImageService = productImageService;
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
        public override ServiceResult<ProductEntity> Add(ProductEntity item)
        {
            var result = base.Add(item);
            if (result.HasViolation)
            {
                return result;
            }
            if (item.ProductTags != null)
            {
                foreach (var tag in item.ProductTags.Where(m => m.Selected))
                {
                    _productTagService.Add(new ProductTag { ProductId = item.ID, TagId = tag.ID });
                }
            }
            if (item.ProductImages != null)
            {
                item.ProductImages.Each(m =>
                {
                    m.ProductId = item.ID;
                    if (m.ActionType == ActionType.Create)
                    {
                        _productImageService.Add(m);
                    }
                });
            }
            return result;
        }
        private void SaveImages(ProductImage item)
        {
            switch (item.ActionType)
            {
                case ActionType.Create:
                    {
                        _productImageService.Add(item);
                        break;
                    }
                case ActionType.Update:
                    {
                        _productImageService.Update(item);
                        break;
                    }
                case ActionType.Delete:
                    {
                        _productImageService.Remove(item);
                        break;
                    }
            }
        }
        public override ServiceResult<ProductEntity> Update(ProductEntity item)
        {
            var result = base.Update(item);
            if (result.HasViolation)
            {
                return result;
            }
            if (item.ProductTags != null)
            {
                _productTagService.Remove(m => m.ProductId == item.ID);
                foreach (var tag in item.ProductTags.Where(m => m.Selected))
                {
                    _productTagService.Add(new ProductTag { ProductId = item.ID, TagId = tag.ID });
                }
            }
            if (item.ProductImages != null)
            {
                item.ProductImages.Each(m =>
                {
                    m.ProductId = item.ID;
                    SaveImages(m);
                });
            }
            return result;
        }
        public override ProductEntity Get(params object[] primaryKey)
        {
            var product = base.Get(primaryKey);
            if (product != null)
            {
                product.ProductTags = _productCategoryTagService.Get(m => m.ProductCategoryId == product.ProductCategoryID);
                var tags = _productTagService.Get(m => m.ProductId == product.ID);
                foreach (var item in product.ProductTags)
                {
                    item.Selected = tags.Any(m => m.TagId == item.ID);
                }
                product.ProductImages = _productImageService.Get(m => m.ProductId == product.ID);
            }

            return product;
        }
        public override void Remove(ProductEntity item)
        {
            if (item.ProductTags != null)
            {
                _productTagService.Remove(m => m.ProductId == item.ID);
            }
            if (item.ProductImages != null)
            {
                item.ProductImages.Each(m =>
                {
                    _productImageService.Remove(m);
                });
            }
            base.Remove(item);
        }
    }
}
