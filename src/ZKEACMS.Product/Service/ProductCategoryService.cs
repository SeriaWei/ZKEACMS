/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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
    public class ProductCategoryService : ServiceBase<ProductCategory>, IProductCategoryService
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
        public override ServiceResult<ProductCategory> Add(ProductCategory item)
        {
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (GetByUrl(item.Url) != null)
                {
                    var result = new ServiceResult<ProductCategory>();
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("Url已存在")));
                    return result;
                }
            }
            return base.Add(item);
        }
        public override ServiceResult<ProductCategory> Update(ProductCategory item)
        {
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (Count(m => m.Url == item.Url && m.ID != item.ID) > 0)
                {
                    var result = new ServiceResult<ProductCategory>();
                    result.RuleViolations.Add(new RuleViolation("Url", _localize.Get("Url已存在")));
                    return result;
                }
            }
            return base.Update(item);
        }
        public ProductCategory GetByUrl(string url)
        {
            return Get(m => m.Url == url).FirstOrDefault();
        }

        private IEnumerable<ProductCategory> LoadChildren(ProductCategory category)
        {
            List<ProductCategory> result = new List<ProductCategory>();
            var children = Get(m => m.ParentID == category.ID);
            result.AddRange(children);
            foreach (var item in children)
            {
                result.AddRange(LoadChildren(item));
            }
            return result;
        }
        public override void Remove(ProductCategory item)
        {
            BeginTransaction(() =>
            {
                _productService.Remove(n => n.ProductCategoryID == item.ID);
                _productCategoryTagService.Remove(m => m.ProductCategoryId == item.ID);
                var childred = LoadChildren(item);
                var ids = childred.Select(m => m.ID).ToArray();
                _productService.Remove(n => ids.Contains(n.ProductCategoryID));
                _productCategoryTagService.Remove(n => ids.Contains(n.ProductCategoryId));
                RemoveRange(childred.ToArray());
                base.Remove(item);
            });
        }
    }
}