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
    public interface IArticleTypeApiService
    {
        ArticleType Get(int id);
        ArticleType GetByName(string name);
        ErrorOr<ArticleType> Create(ArticleType articleType);
        ErrorOr<ArticleType> Update(ArticleType articleType);
        void Delete(int id);
    }
}
