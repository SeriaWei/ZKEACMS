/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;
using ZKEACMS.Safety;

namespace ZKEACMS.Product.Service
{
    public class ProductApiService : IProductApiService
    {
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        private readonly IAuthorizer _authorizer;
        private readonly IHtmlSanitizer _htmlSanitizer;

        public ProductApiService(IProductService productService,
            IAuthorizer authorizer,
            IProductCategoryService productCategoryService,
            IHtmlSanitizer htmlSanitizer)
        {
            _productService = productService;
            _authorizer = authorizer;
            _productCategoryService = productCategoryService;
            _htmlSanitizer = htmlSanitizer;
        }

        public ProductEntity Get(int id)
        {
            var product = _productService.Get(id);
            if (product == null) return null;

            if (!product.IsPublish && !_authorizer.Authorize(PermissionKeys.ViewProduct))
            {
                return null;
            }
            return product;
        }

        public ProductEntity GetByName(string name)
        {
            var product = _productService.GetByUrl(name);
            if (product == null) return null;

            if (!product.IsPublish && !_authorizer.Authorize(PermissionKeys.ViewProduct))
            {
                return null;
            }
            return product;
        }
        public ServiceResult<ProductEntity> Create(ProductEntity product)
        {
            var validResult = ValidProductType(product);
            if (validResult.HasViolation) return validResult;

            if (product.ProductImages != null)
            {
                foreach (var item in product.ProductImages)
                {
                    item.ActionType = ActionType.Create;
                }
            }
            product.ProductContent = _htmlSanitizer.Sanitize(product.ProductContent);
            return _productService.Add(product);
        }

        public ServiceResult<ProductEntity> Update(ProductEntity product)
        {
            var validResult = ValidProductType(product);
            if (validResult.HasViolation) return validResult;

            if (product.ProductImages != null)
            {
                foreach (var item in product.ProductImages)
                {
                    if (item.ActionType == null)
                    {
                        item.ActionType = ActionType.Create;
                    }
                }
            }
            product.ProductContent = _htmlSanitizer.Sanitize(product.ProductContent);
            return _productService.Update(product);
        }

        private ServiceResult<ProductEntity> ValidProductType(ProductEntity product)
        {
            ServiceResult<ProductEntity> serviceResult = new ServiceResult<ProductEntity>();
            ProductCategory productType = _productCategoryService.Get(product.ProductCategoryID);
            if (productType == null)
            {
                serviceResult.AddRuleViolation("ProductTypeID", "Product type is not exist.");
                return serviceResult;
            }
            return serviceResult;
        }

        public void Delete(int id)
        {
            _productService.Remove(id);
        }

        public ProductEntity Publish(int id)
        {
            var product = _productService.Get(id);
            if (product == null) return null;

            _productService.Publish(product);
            return product;
        }
    }
}
