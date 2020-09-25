/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public class ArticleUrlService : IArticleUrlService
    {
        private readonly IArticleService _articleService;
        private readonly IArticleListWidgetService _articleListWidgetService;
        private readonly IArticleTypeService _articleTypeService;

        public ArticleUrlService(IArticleService articleService,
            IArticleListWidgetService articleListWidgetService,
            IArticleTypeService articleTypeService)
        {
            _articleService = articleService;
            _articleListWidgetService = articleListWidgetService;
            _articleTypeService = articleTypeService;
        }

        public IEnumerable<ArticleUrl> GetAllPublicUrls()
        {
            HashSet<string> excuted = new HashSet<string>();
            foreach (var item in _articleListWidgetService.Get().ToList())
            {
                string typeDetail = $"{item.DetailPageUrl}-{item.ArticleTypeID}";
                if (item.DetailPageUrl.IsNotNullAndWhiteSpace() && !excuted.Contains(typeDetail))
                {
                    var ids = _articleTypeService.Get(m => m.ID == item.ArticleTypeID || m.ParentID == item.ArticleTypeID).Select(m => m.ID).ToList();
                    var articles = _articleService.Get(m => m.IsPublish && ids.Contains(m.ArticleTypeID ?? 0));
                    foreach (var article in articles)
                    {
                        string post = article.Url.IsNullOrWhiteSpace() ? $"post-{article.ID}" : article.Url;
                        yield return new ArticleUrl
                        {
                            Url = Helper.Url.ToVirtualPath($"{item.DetailPageUrl}/{post}.html"),
                            Article = article
                        };
                    }
                    excuted.Add(typeDetail);
                }
            }
        }

        public string[] GetDetailPages()
        {
            return _articleListWidgetService.Get(m => m.DetailPageUrl != null)
                .Select(m => Helper.Url.ToVirtualPath(m.DetailPageUrl)).Distinct().ToArray();
        }

        public string[] GetPublicUrl(int ID)
        {
            ArticleEntity article = _articleService.Get(ID);
            if (article == null) return null;

            return GetPublicUrl(article);
        }

        public string[] GetPublicUrl(ArticleEntity article)
        {
            int articleTypeId = article.ArticleTypeID ?? 0;
            if (articleTypeId == 0) return null;

            ArticleType articleType = _articleTypeService.Get(articleTypeId);

            string[] detailPageUrls = _articleListWidgetService.Get(m => m.ArticleTypeID == articleType.ID || m.ArticleTypeID == articleType.ParentID)
                .Select(m => m.DetailPageUrl)
                .Distinct()
                .ToArray();

            string post = article.Url.IsNullOrWhiteSpace() ? $"post-{article.ID}" : article.Url;
            for (int i = 0; i < detailPageUrls.Length; i++)
            {
                detailPageUrls[i] = Helper.Url.ToVirtualPath($"{detailPageUrls[i]}/{post}.html");
            }
            return detailPageUrls;
        }
    }
}
