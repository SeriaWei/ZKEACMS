/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.RepositoryPattern;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public interface IArticleTypeService : IService<ArticleType>
    {
        IEnumerable<ArticleType> GetChildren(long id);
        ArticleType GetByUrl(string url);
    }
}