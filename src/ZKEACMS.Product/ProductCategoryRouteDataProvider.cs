using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Routing;
using ZKEACMS.Product.Service;
using ZKEACMS.Route;

namespace ZKEACMS.Product
{
    public class ProductCategoryRouteDataProvider : IRouteDataProvider
    {
        private readonly IProductCategoryService _productCategoryService;
        private readonly ProductCategoryWidgetService _productCategoryWidgetService;
        public ProductCategoryRouteDataProvider(IProductCategoryService productCategoryService, ProductCategoryWidgetService productCategoryWidgetService)
        {
            _productCategoryService = productCategoryService;
            _productCategoryWidgetService = productCategoryWidgetService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            string[] urls = _productCategoryWidgetService.GetRelatedPageUrls();
            if (pathArray.Length > 1 && urls.Any(m => m.Length < path.Length && path.StartsWith(m, StringComparison.InvariantCultureIgnoreCase)))
            {
                var category = _productCategoryService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (category != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    
                    values.SetCategoryUrl(url);
                    values.SetCategory(category.ID);

                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
                }

            }
            return path;
        }
    }
}
