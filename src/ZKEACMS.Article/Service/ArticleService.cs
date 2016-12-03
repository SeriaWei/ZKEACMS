/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Data;
using Easy.RepositoryPattern;
using Easy.Web.CMS.Article.Models;
using Easy.Web.CMS.Article.Service;

namespace ZKEACMS.Article.Service
{
    public class ArticleService : ServiceBase<ArticleEntity>, IArticleService
    {
        public void Publish(long ID)
        {
            Update(new ArticleEntity { IsPublish = true, PublishDate = DateTime.Now }, new DataFilter(new List<string> { "IsPublish", "PublishDate" }).Where("ID", OperatorType.Equal, ID));
        }
    }
}