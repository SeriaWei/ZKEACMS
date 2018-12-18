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
        public ProductRouteDataProvider(IProductService productService)
        {
            _productService = productService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            if (pathArray.Length > 1)
            {
                var product = _productService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (product != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    if (!values.ContainsKey(StringKeys.RouteVale_ProductUrl))
                    {
                        values.Add(StringKeys.RouteVale_ProductUrl, url);
                    }
                    if (!values.ContainsKey(StringKeys.RouteValue_Post))
                    {
                        values.Add(StringKeys.RouteValue_Post, product.ID);
                    }
                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
                }
                
            }
            return path;
        }
    }
}
