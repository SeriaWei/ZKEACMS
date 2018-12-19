using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Routing;
using ZKEACMS.Article.Service;
using ZKEACMS.Route;

namespace ZKEACMS.Article
{
    public class ArticleRouteDataProvider : IRouteDataProvider
    {
        private readonly IArticleService _articleService;
        public ArticleRouteDataProvider(IArticleService articleService)
        {
            _articleService = articleService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            if (pathArray.Length > 1)
            {
                var article = _articleService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (article != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    if (!values.ContainsKey(StringKeys.RouteVale_ArticleUrl))
                    {
                        values.Add(StringKeys.RouteVale_ArticleUrl, url);
                    }
                    if (!values.ContainsKey(StringKeys.RouteValue_Post))
                    {
                        values.Add(StringKeys.RouteValue_Post, article.ID);
                    }
                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";

                }
                
            }
            return path;
        }
    }
}
