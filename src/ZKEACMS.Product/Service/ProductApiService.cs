using Easy.Mvc.Authorize;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public class ProductApiService : IProductApiService
    {
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        private readonly IAuthorizer _authorizer;

        public ProductApiService(IProductService productService, IAuthorizer authorizer, IProductCategoryService productCategoryService)
        {
            _productService = productService;
            _authorizer = authorizer;
            _productCategoryService = productCategoryService;
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

            return _productService.Add(product);
        }

        public ServiceResult<ProductEntity> Update(ProductEntity product)
        {
            var validResult = ValidProductType(product);
            if (validResult.HasViolation) return validResult;

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
