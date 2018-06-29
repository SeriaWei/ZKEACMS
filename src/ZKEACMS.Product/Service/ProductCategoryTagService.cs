/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryTagService : ServiceBase<ProductCategoryTag>, IProductCategoryTagService
    {
        private readonly IProductTagService _productTagService;
        public ProductCategoryTagService(IApplicationContext applicationContext,IProductTagService productTagService, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productTagService = productTagService;
        }
        
        public override void Remove(ProductCategoryTag item)
        {
            _productTagService.Remove(m => m.TagId == item.ID);
            if (item.ParentId == 0)
            {
                Remove(m => m.ParentId == item.ID);
            }
            base.Remove(item);
        }
    }
}
