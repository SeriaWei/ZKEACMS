/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using Easy.RepositoryPattern;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public interface IArticleTypeService : IService<ArticleType>
    {
        IEnumerable<ArticleType> GetChildren(long id);
        ArticleType GetByUrl(string url);
        void Move(int id, int parentId, int position);
    }
}