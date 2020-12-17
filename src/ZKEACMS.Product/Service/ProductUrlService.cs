/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public class ProductUrlService : IProductUrlService
    {
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        private readonly IProductListWidgetService _productListWidgetService;

        public ProductUrlService(IProductListWidgetService productListWidgetService,
            IProductService productService,
            IProductCategoryService productCategoryService)
        {
            _productListWidgetService = productListWidgetService;
            _productService = productService;
            _productCategoryService = productCategoryService;
        }

        public IEnumerable<ProductUrl> GetAllPublicUrls()
        {
            HashSet<string> excuted = new HashSet<string>();
            foreach (var item in _productListWidgetService.Get().ToList())
            {
                string typeDetail = $"{item.DetailPageUrl}-{item.ProductCategoryID}";
                if (item.DetailPageUrl.IsNotNullAndWhiteSpace() && !excuted.Contains(typeDetail))
                {
                    var ids = _productCategoryService.Get(m => m.ID == item.ProductCategoryID || m.ParentID == item.ProductCategoryID).Select(m => m.ID).ToList();
                    var products = _productService.Get(m => m.IsPublish && ids.Contains(m.ProductCategoryID));
                    foreach (var product in products)
                    {
                        string post = product.Url.IsNullOrWhiteSpace() ? $"post-{product.ID}" : product.Url;
                        yield return new ProductUrl
                        {
                            Url = Helper.Url.ToVirtualPath($"{item.DetailPageUrl}/{post}.html"),
                            Product = product
                        };
                    }
                    excuted.Add(typeDetail);
                }
            }
        }

        public string[] GetDetailPages()
        {
            return _productListWidgetService.Get(m => m.DetailPageUrl != null).Select(m => Helper.Url.ToVirtualPath(m.DetailPageUrl)).Distinct().ToArray();
        }

        public string[] GetPublicUrl(int ID)
        {
            ProductEntity product = _productService.Get(ID);
            if (product == null) return null;

            return GetPublicUrl(product);
        }

        public string[] GetPublicUrl(ProductEntity product)
        {
            int categoryId = product.ProductCategoryID;
            if (categoryId == 0) return null;

            ProductCategory productCategory = _productCategoryService.Get(categoryId);

            string[] detailPageUrls = _productListWidgetService.Get(m => m.ProductCategoryID == productCategory.ID || m.ProductCategoryID == productCategory.ParentID)
                .Select(m => m.DetailPageUrl)
                .Distinct()
                .ToArray();

            string post = product.Url.IsNullOrWhiteSpace() ? $"post-{product.ID}" : product.Url;
            for (int i = 0; i < detailPageUrls.Length; i++)
            {
                detailPageUrls[i] = Helper.Url.ToVirtualPath($"{detailPageUrls[i]}/{post}.html");
            }
            return detailPageUrls;
        }
    }
}
