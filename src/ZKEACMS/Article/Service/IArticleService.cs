/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public interface IArticleService : IService<ArticleEntity>
    {
        void Publish(int ID);
        void IncreaseCount(ArticleEntity article);
        ArticleEntity GetPrev(ArticleEntity article);
        ArticleEntity GetNext(ArticleEntity article);
        ArticleEntity GetByUrl(string url);
    }
}