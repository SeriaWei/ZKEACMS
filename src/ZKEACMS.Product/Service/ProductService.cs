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
using System.Linq.Expressions;

namespace ZKEACMS.Product.Service
{
    public class ProductService : ServiceBase<ProductEntity>, IProductService
    {
        private readonly IProductTagService _productTagService;
        private readonly IProductCategoryTagService _productCategoryTagService;
        private readonly IProductImageService _productImageService;
        private readonly ILocalize _localize;
        public ProductService(IApplicationContext applicationContext,
            IProductTagService productTagService,
            IProductCategoryTagService productCategoryTagService,
            IProductImageService productImageService,
            ILocalize localize,
            CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productTagService = productTagService;
            _productCategoryTagService = productCategoryTagService;
            _productImageService = productImageService;
            _localize = localize;
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
            ServiceResult<ProductEntity> result = new ServiceResult<ProductEntity>();
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (GetByUrl(item.Url) != null)
                {
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("Url已存在")));
                    return result;
                }
            }
            BeginTransaction(() =>
            {
                result = base.Add(item);
                if (!result.HasViolation)
                {
                    if (item.ProductTags != null)
                    {
                        _productTagService.BeginBulkSave();
                        foreach (var tag in item.ProductTags.Where(m => m.Selected))
                        {
                            _productTagService.Add(new ProductTag { ProductId = item.ID, TagId = tag.ID });
                        }
                        _productTagService.SaveChanges();
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
                }
            });

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
                        if (item.ID > 0)
                        {
                            _productImageService.Remove(item);
                        }
                        break;
                    }
            }
        }
        public override ServiceResult<ProductEntity> Update(ProductEntity item)
        {
            ServiceResult<ProductEntity> result = new ServiceResult<ProductEntity>();
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (Count(m => m.Url == item.Url && m.ID != item.ID) > 0)
                {
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("Url已存在")));
                    return result;
                }
            }
            BeginTransaction(() =>
            {
                result = base.Update(item);
                if (!result.HasViolation)
                {
                    if (item.ProductTags != null)
                    {
                        _productTagService.Remove(m => m.ProductId == item.ID);
                        _productTagService.BeginBulkSave();
                        foreach (var tag in item.ProductTags.Where(m => m.Selected))
                        {
                            _productTagService.Add(new ProductTag { ProductId = item.ID, TagId = tag.ID });
                        }
                        _productTagService.SaveChanges();
                    }
                    if (item.ProductImages != null)
                    {
                        _productImageService.BeginBulkSave();
                        item.ProductImages.Each(m =>
                        {
                            m.ProductId = item.ID;
                            SaveImages(m);
                        });
                        _productImageService.SaveChanges();
                    }
                }
            });

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
            BeginTransaction(() =>
            {
                _productTagService.Remove(m => m.ProductId == item.ID);
                _productImageService.Remove(m => m.ProductId == item.ID);
                base.Remove(item);
            });
        }

        public override void Remove(Expression<Func<ProductEntity, bool>> filter)
        {
            var products = Get(filter);
            var productIds = products.Select(m => m.ID).ToArray();

            _productTagService.Remove(m => productIds.Contains(m.ProductId));
            _productImageService.Remove(m => productIds.Contains(m.ProductId));

            RemoveRange(products.ToArray());
        }

        public ProductEntity GetByUrl(string url)
        {
            return Get(m => m.Url == url).FirstOrDefault();
        }
    }
}
