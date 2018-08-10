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
        public ProductCategoryService(IProductService productService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _productService = productService;
        }
        public override ServiceResult<ProductCategory> Add(ProductCategory item)
        {
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                if (GetByUrl(item.Url) != null)
                {
                    var result = new ServiceResult<ProductCategory>();
                    result.RuleViolations.Add(new RuleViolation("Url", "Url已存在"));
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
                    result.RuleViolations.Add(new RuleViolation("Url", "Url已存在"));
                    return result;
                }
            }
            return base.Update(item);
        }
        public ProductCategory GetByUrl(string url)
        {
            return Get(m => m.Url == url).FirstOrDefault();
        }

        public IEnumerable<ProductCategory> GetChildren(long id)
        {
            return Get(m => m.ParentID == id);
        }
        public override void Remove(ProductCategory item)
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
            base.Remove(item);
        }
    }
}