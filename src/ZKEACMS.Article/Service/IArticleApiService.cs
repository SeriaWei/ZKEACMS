using Easy.RepositoryPattern;
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
        ServiceResult<ArticleEntity> Create(ArticleEntity article);
        ServiceResult<ArticleEntity> Update(ArticleEntity article);
        ArticleEntity Publish(int id);
        void Delete(int id);
    }
}
