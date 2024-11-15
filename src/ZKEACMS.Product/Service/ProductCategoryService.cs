/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using Easy.Extend;
using Easy.RepositoryPattern;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryService : ServiceBase<ProductCategory, CMSDbContext>, IProductCategoryService
    {
        private readonly IProductService _productService;
        private readonly IProductCategoryTagService _productCategoryTagService;
        private readonly ILocalize _localize;
        public ProductCategoryService(IProductService productService,
            IApplicationContext applicationContext,
            IProductCategoryTagService productCategoryTagService,
            ILocalize localize,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _productService = productService;
            _productCategoryTagService = productCategoryTagService;
            _localize = localize;
        }
        public override ErrorOr<ProductCategory> Add(ProductCategory item)
        {
            if (item.Url.IsNotNullAndWhiteSpace() && GetByUrl(item.Url) != null)
            {
                return new Error("Url", _localize.Get("URL already exists"));
            }
            return base.Add(item);
        }
        public override ErrorOr<ProductCategory> Update(ProductCategory item)
        {
            if (item.Url.IsNotNullAndWhiteSpace() && Count(m => m.Url == item.Url && m.ID != item.ID) > 0)
            {
                return new Error("Url", _localize.Get("URL already exists"));
            }
            return base.Update(item);
        }
        public ProductCategory GetByUrl(string url)
        {
            return Get(m => m.Url == url).FirstOrDefault();
        }

        public override void Remove(ProductCategory item)
        {
            BeginTransaction(() =>
            {
                _productService.Remove(n => n.ProductCategoryID == item.ID);
                _productCategoryTagService.Remove(m => m.ProductCategoryId == item.ID);
                foreach (var item in Get(m => m.ParentID == item.ID))
                {
                    Remove(item);
                }
                base.Remove(item);
            });
        }

        public void Move(int id, int parentId, int position)
        {
            var productCategory = Get(id);
            productCategory.ParentID = parentId;
            var siblings = Get().Where(m => m.ParentID == productCategory.ParentID && m.ID != productCategory.ID).OrderBy(m => m.DisplayOrder ?? m.ID).ToList();
            siblings.Insert(position, productCategory);

            for (int i = 0; i < siblings.Count; i++)
            {
                siblings[i].DisplayOrder = i + 1;
            }
            UpdateRange(siblings.ToArray());
        }
    }
}