/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public interface IArticleListWidgetDataService : IService<ArticleListWidget>
    {
        void UpdateDetailPageUrl(string oldUrl, string newUrl);
    }
}
