/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
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

        public ServiceResult<ProductCategory> Create(ProductCategory productCategory)
        {
            var validResult = ValidParentId(productCategory);
            if (validResult.HasViolation) return validResult;

            return _productCategoryService.Add(productCategory);
        }
        private ServiceResult<ProductCategory> ValidParentId(ProductCategory productCategory)
        {
            ServiceResult<ProductCategory> result = new ServiceResult<ProductCategory>();
            if (productCategory.ParentID > 0)
            {
                var parentProductCategory = _productCategoryService.Get(productCategory.ParentID);
                if (parentProductCategory == null)
                {
                    result.AddRuleViolation("ParentID", "Parent is not exist");
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

        public ServiceResult<ProductCategory> Update(ProductCategory productCategory)
        {
            var validResult = ValidParentId(productCategory);
            if (validResult.HasViolation) return validResult;

            return _productCategoryService.Update(productCategory);
        }
    }
}
