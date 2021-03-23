/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public class ArticleTypeApiService : IArticleTypeApiService
    {
        private readonly IArticleTypeService _articleTypeService;

        public ArticleTypeApiService(IArticleTypeService articleTypeService)
        {
            _articleTypeService = articleTypeService;
        }

        public ServiceResult<ArticleType> Create(ArticleType articleType)
        {
            var validResult= ValidParentId(articleType);
            if (validResult.HasViolation) return validResult;

            return _articleTypeService.Add(articleType);
        }
        private ServiceResult<ArticleType> ValidParentId(ArticleType articleType)
        {
            ServiceResult<ArticleType> result = new ServiceResult<ArticleType>();
            if (articleType.ParentID.HasValue)
            {
                var parentArticleType = _articleTypeService.Get(articleType.ParentID.Value);
                if (parentArticleType == null)
                {
                    result.AddRuleViolation("ParentID", "Parent is not exist");
                }
            }
            return result;
        }
        public void Delete(int id)
        {
            _articleTypeService.Remove(id);
        }

        public ArticleType Get(int id)
        {
            return _articleTypeService.Get(id);
        }

        public ArticleType GetByName(string name)
        {
            return _articleTypeService.GetByUrl(name);
        }

        public ServiceResult<ArticleType> Update(ArticleType articleType)
        {
            var validResult = ValidParentId(articleType);
            if (validResult.HasViolation) return validResult;

            return _articleTypeService.Update(articleType);
        }
    }
}
