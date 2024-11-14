/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
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

        public ErrorOr<ArticleType> Create(ArticleType articleType)
        {
            var validResult= ValidParentId(articleType);
            if (validResult.HasError) return validResult;

            return _articleTypeService.Add(articleType);
        }
        private ErrorOr<ArticleType> ValidParentId(ArticleType articleType)
        {
            ErrorOr<ArticleType> result = new ErrorOr<ArticleType>();
            if (articleType.ParentID.HasValue)
            {
                var parentArticleType = _articleTypeService.Get(articleType.ParentID.Value);
                if (parentArticleType == null)
                {
                    result.AddError("ParentID", "Parent is not exist");
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

        public ErrorOr<ArticleType> Update(ArticleType articleType)
        {
            var validResult = ValidParentId(articleType);
            if (validResult.HasError) return validResult;

            return _articleTypeService.Update(articleType);
        }
    }
}
