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
    public interface IArticleApiService
    {
        ArticleEntity Get(int id);
        ArticleEntity GetByName(string name);
        ErrorOr<ArticleEntity> Create(ArticleEntity article);
        ErrorOr<ArticleEntity> Update(ArticleEntity article);
        ArticleEntity Publish(int id);
        void Delete(int id);
    }
}
