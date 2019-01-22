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
        private readonly ArticleDetailWidgetService _articleDetailWidgetService;
        public ArticleRouteDataProvider(IArticleService articleService, ArticleDetailWidgetService articleDetailWidgetService)
        {
            _articleService = articleService;
            _articleDetailWidgetService = articleDetailWidgetService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            string[] urls = _articleDetailWidgetService.GetRelatedPageUrls();
            if (pathArray.Length > 1 && urls.Any(m => m.Length < path.Length && path.StartsWith(m, StringComparison.InvariantCultureIgnoreCase)))
            {
                var article = _articleService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (article != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    values.SetArticleUrl(url);
                    values.SetArticle(article);
                    values.SetPost(article.ID);
                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
                }
                
            }
            return path;
        }
    }
}
