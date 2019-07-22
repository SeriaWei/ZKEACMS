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
        private readonly ArticleTypeWidgetService _articleTypeWidgetService;
        public ArticleTypeRouteDataProvider(IArticleTypeService articleTypeService, ArticleTypeWidgetService articleTypeWidgetService)
        {
            _articleTypeService = articleTypeService;
            _articleTypeWidgetService = articleTypeWidgetService;
        }
        public int Order { get { return 1; } }

        public string ExtractVirtualPath(string path, RouteValueDictionary values)
        {
            var pathArray = path.Split("/", StringSplitOptions.RemoveEmptyEntries);
            string[] urls = _articleTypeWidgetService.GetRelatedPageUrls();
            if (pathArray.Length > 1 && urls.Any(m => m.Length < path.Length && path.StartsWith(m, StringComparison.InvariantCultureIgnoreCase)))
            {
                var articleType = _articleTypeService.GetByUrl(pathArray[pathArray.Length - 1]);
                if (articleType != null)
                {
                    var url = pathArray[pathArray.Length - 1];
                    values.SetCategoryUrl(url);
                    values.SetCategory(articleType.ID);
                    path = $"/{string.Join("/", pathArray, 0, pathArray.Length - 1)}";
                }

            }
            return path;
        }
    }
}
