/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
using ZKEACMS.Event;

namespace ZKEACMS.Product.Service
{
    public class ProductService : ServiceBase<ProductEntity, CMSDbContext>, IProductService
    {
        private readonly IProductTagService _productTagService;
        private readonly IProductCategoryTagService _productCategoryTagService;
        private readonly IProductImageService _productImageService;
        private readonly ILocalize _localize;
        private readonly IEventManager _eventManager;
        public ProductService(IApplicationContext applicationContext,
            IProductTagService productTagService,
            IProductCategoryTagService productCategoryTagService,
            IProductImageService productImageService,
            ILocalize localize,
            IEventManager eventManager,
            CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productTagService = productTagService;
            _productCategoryTagService = productCategoryTagService;
            _productImageService = productImageService;
            _localize = localize;
            _eventManager = eventManager;
        }

        public void Publish(int ID)
        {
            Publish(Get(ID));
        }
        public override ErrorOr<ProductEntity> Add(ProductEntity item)
        {
            ErrorOr<ProductEntity> result = new ErrorOr<ProductEntity>();
            if (item.Url.IsNotNullAndWhiteSpace() && GetByUrl(item.Url) != null)
            {
                return new Error("Url", _localize.Get("URL already exists"));
            }
            _eventManager.Trigger(Events.OnProductAdding, item);
            BeginTransaction(() =>
            {
                result = base.Add(item);
                if (!result.HasError)
                {
                    if (item.ProductTags != null)
                    {
                        _productTagService.BeginBulkSave();
                        foreach (var tag in item.ProductTags.Where(m => m.Selected))
                        {
                            _productTagService.Add(new ProductTag { ProductId = item.ID, TagId = tag.ID });
                        }
                        _productTagService.EndBulkSave();
                    }
                    if (item.ProductImages != null)
                    {
                        item.ProductImages.Each(m =>
                        {
                            m.ProductId = item.ID;
                            if (m.ActionType.HasFlag(ActionType.Create))
                            {
                                _productImageService.Add(m);
                            }
                        });
                    }
                }
            });
            _eventManager.Trigger(Events.OnProductAdded, item);
            return result;
        }
        private void SaveImages(ProductImage item)
        {
            if (item.ActionType.HasFlag(ActionType.Create))
            {
                _productImageService.Add(item);
            }
            else if (item.ActionType.HasFlag(ActionType.Update))
            {
                _productImageService.Update(item);
            }
            else if (item.ActionType.HasFlag(ActionType.Delete))
            {
                if (item.ID > 0)
                {
                    _productImageService.Remove(item);
                }
            }

        }
        public override ErrorOr<ProductEntity> Update(ProductEntity item)
        {
            ErrorOr<ProductEntity> result = new ErrorOr<ProductEntity>();
            if (item.Url.IsNotNullAndWhiteSpace() && Count(m => m.Url == item.Url && m.ID != item.ID) > 0)
            {
                return new Error("Url", _localize.Get("URL already exists"));
            }
            _eventManager.Trigger(Events.OnProductUpdating, item);
            BeginTransaction(() =>
            {
                result = base.Update(item);
                if (!result.HasError)
                {
                    if (item.ProductTags != null)
                    {
                        _productTagService.Remove(m => m.ProductId == item.ID);
                        _productTagService.BeginBulkSave();
                        foreach (var tag in item.ProductTags.Where(m => m.Selected))
                        {
                            _productTagService.Add(new ProductTag { ProductId = item.ID, TagId = tag.ID });
                        }
                        _productTagService.EndBulkSave();
                    }
                    if (item.ProductImages != null)
                    {
                        _productImageService.BeginBulkSave();
                        item.ProductImages.Each(m =>
                        {
                            m.ProductId = item.ID;
                            SaveImages(m);
                        });
                        _productImageService.EndBulkSave();
                    }
                }
            });
            _eventManager.Trigger(Events.OnProductUpdated, item);
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
            _eventManager.Trigger(Events.OnProductDeleting, item);
            BeginTransaction(() =>
            {
                _productTagService.Remove(m => m.ProductId == item.ID);
                _productImageService.Remove(m => m.ProductId == item.ID);
                base.Remove(item);
            });
            _eventManager.Trigger(Events.OnProductDeleted, item);
        }

        public override void Remove(Expression<Func<ProductEntity, bool>> filter)
        {
            var products = Get(filter);
            var productIds = products.Select(m => m.ID).ToArray();

            _productTagService.Remove(m => productIds.Contains(m.ProductId));
            _productImageService.Remove(m => productIds.Contains(m.ProductId));

            RemoveRange(products.ToArray());
        }
        public override void RemoveRange(params ProductEntity[] items)
        {
            items.Each(item => _eventManager.Trigger(Events.OnProductDeleting, item));
            base.RemoveRange(items);
            items.Each(item => _eventManager.Trigger(Events.OnProductDeleted, item));
        }
        public ProductEntity GetByUrl(string url)
        {
            ProductEntity product = Get(m => m.Url == url).FirstOrDefault();
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

        public void Publish(ProductEntity product)
        {
            product.IsPublish = true;
            product.PublishDate = DateTime.Now;
            if (product.ID > 0)
            {
                base.Update(product);
            }
            _eventManager.Trigger(Events.OnProductPublished, product);
        }

        public ProductEntity GetLatestPublished()
        {
            return Get().Where(m => m.Status == (int)RecordStatus.Active && m.IsPublish).OrderByDescending(m => m.ID).Take(1).ToList().FirstOrDefault();
        }
    }
}
