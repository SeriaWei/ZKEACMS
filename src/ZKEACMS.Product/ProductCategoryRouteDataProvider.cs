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
        public ProductCategoryRouteDataProvider(IProductCategoryService productCategoryService)
        {
            _productCategoryService = productCategoryService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            if (pathArray.Length > 1)
            {
                var category = _productCategoryService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (category != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    if (!values.ContainsKey(StringKeys.RouteVale_CategoryUrl))
                    {
                        values.Add(StringKeys.RouteVale_CategoryUrl, url);
                    }
                    if (!values.ContainsKey(StringKeys.RouteValue_Category))
                    {
                        values.Add(StringKeys.RouteValue_Category, category.ID);
                    }
                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
                }
                
            }
            return path;
        }
    }
}
