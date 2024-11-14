/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryApiService : IProductCategoryApiService
    {
        private readonly IProductCategoryService _productCategoryService;

        public ProductCategoryApiService(IProductCategoryService productCategoryService)
        {
            _productCategoryService = productCategoryService;
        }

        public ErrorOr<ProductCategory> Create(ProductCategory productCategory)
        {
            var validResult = ValidParentId(productCategory);
            if (validResult.HasError) return validResult;

            return _productCategoryService.Add(productCategory);
        }
        private ErrorOr<ProductCategory> ValidParentId(ProductCategory productCategory)
        {
            ErrorOr<ProductCategory> result = new ErrorOr<ProductCategory>();
            if (productCategory.ParentID > 0)
            {
                var parentProductCategory = _productCategoryService.Get(productCategory.ParentID);
                if (parentProductCategory == null)
                {
                    result.AddError("ParentID", "Parent is not exist");
                }
            }
            return result;
        }
        public void Delete(int id)
        {
            _productCategoryService.Remove(id);
        }

        public ProductCategory Get(int id)
        {
            return _productCategoryService.Get(id);
        }

        public ProductCategory GetByName(string name)
        {
            return _productCategoryService.GetByUrl(name);
        }

        public ErrorOr<ProductCategory> Update(ProductCategory productCategory)
        {
            var validResult = ValidParentId(productCategory);
            if (validResult.HasError) return validResult;

            return _productCategoryService.Update(productCategory);
        }
    }
}
