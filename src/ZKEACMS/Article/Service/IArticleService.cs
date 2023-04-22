/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public interface IArticleService : IService<ArticleEntity>
    {
        void Publish(int ID);
        void Publish(ArticleEntity article);
        void IncreaseCount(ArticleEntity article);
        ArticleEntity GetPrev(ArticleEntity article);
        ArticleEntity GetNext(ArticleEntity article);
        ArticleEntity GetByUrl(string url);
        ArticleEntity GetLatestPublished();
    }
}