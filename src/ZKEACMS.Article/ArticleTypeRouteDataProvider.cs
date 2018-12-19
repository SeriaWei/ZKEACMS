using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Routing;
using ZKEACMS.Article.Service;
using ZKEACMS.Route;

namespace ZKEACMS.Article
{
    public class ArticleTypeRouteDataProvider : IRouteDataProvider
    {
        private readonly IArticleTypeService _articleTypeService;
        public ArticleTypeRouteDataProvider(IArticleTypeService articleTypeService)
        {
            _articleTypeService = articleTypeService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            if (pathArray.Length > 1)
            {
                var articleType = _articleTypeService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (articleType != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    if (!values.ContainsKey(StringKeys.RouteVale_CategoryUrl))
                    {
                        values.Add(StringKeys.RouteVale_CategoryUrl, url);
                    }
                    if (!values.ContainsKey(StringKeys.RouteValue_Category))
                    {
                        values.Add(StringKeys.RouteValue_Category, articleType.ID);
                    }
                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
                }
                
            }
            return path;
        }
    }
}
