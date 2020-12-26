using Easy.Mvc.Authorize;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public class ArticleApiService : IArticleApiService
    {
        private readonly IArticleService _articleService;
        private readonly IArticleTypeService _articleTypeService;
        private readonly IAuthorizer _authorizer;

        public ArticleApiService(IArticleService articleService, IAuthorizer authorizer, IArticleTypeService articleTypeService)
        {
            _articleService = articleService;
            _authorizer = authorizer;
            _articleTypeService = articleTypeService;
        }

        public ArticleEntity Get(int id)
        {
            var article = _articleService.Get(id);
            if (article == null) return null;

            if (!article.IsPublish && !_authorizer.Authorize(PermissionKeys.ViewArticle))
            {
                return null;
            }
            return article;
        }

        public ArticleEntity GetByName(string name)
        {
            var article = _articleService.GetByUrl(name);
            if (article == null) return null;

            if (!article.IsPublish && !_authorizer.Authorize(PermissionKeys.ViewArticle))
            {
                return null;
            }
            return article;
        }
        public ServiceResult<ArticleEntity> Create(ArticleEntity article)
        {
            var validResult = ValidArticleType(article);
            if (validResult.HasViolation) return validResult;

            return _articleService.Add(article);
        }

        public ServiceResult<ArticleEntity> Update(ArticleEntity article)
        {
            var validResult = ValidArticleType(article);
            if (validResult.HasViolation) return validResult;

            return _articleService.Update(article);
        }

        private ServiceResult<ArticleEntity> ValidArticleType(ArticleEntity article)
        {
            ServiceResult<ArticleEntity> serviceResult = new ServiceResult<ArticleEntity>();
            ArticleType articleType = _articleTypeService.Get(article.ArticleTypeID ?? 0);
            if (articleType == null)
            {
                serviceResult.AddRuleViolation("ArticleTypeID", "Article type is not exist.");
                return serviceResult;
            }
            return serviceResult;
        }

        public void Delete(int id)
        {
            _articleService.Remove(id);
        }

        public ArticleEntity Publish(int id)
        {
            var article = _articleService.Get(id);
            if (article == null) return null;

            _articleService.Publish(article);
            return article;
        }
    }
}
