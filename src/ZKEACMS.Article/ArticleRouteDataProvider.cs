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
            if (pathArray.Length > 1 && _articleService.GetByUrl(pathArray[pathArray.Length - 1]) != null)
            {
                var url = pathArray[pathArray.Length - 1];
                if (!values.ContainsKey("ArticleUrl"))
                {
                    values.Add("ArticleUrl", url);
                }
                path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
            }
            return path;
        }
    }
}
