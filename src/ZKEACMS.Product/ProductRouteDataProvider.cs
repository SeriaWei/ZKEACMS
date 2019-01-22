using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Routing;
using ZKEACMS.Product.Service;
using ZKEACMS.Route;

namespace ZKEACMS.Product
{
    public class ProductRouteDataProvider : IRouteDataProvider
    {
        private readonly IProductService _productService;
        private readonly ProductDetailWidgetService _productDetailWidgetService;
        public ProductRouteDataProvider(IProductService productService, ProductDetailWidgetService productDetailWidgetService)
        {
            _productService = productService;
            _productDetailWidgetService = productDetailWidgetService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            string[] urls = _productDetailWidgetService.GetRelatedPageUrls();
            if (pathArray.Length > 1 && urls.Any(m => m.Length < path.Length && path.StartsWith(m, StringComparison.InvariantCultureIgnoreCase)))
            {
                var product = _productService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (product != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    values.SetProductUrl(url);
                    values.SetPost(product.ID);
                    values.SetProduct(product);
                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
                }
                
            }
            return path;
        }
    }
}
