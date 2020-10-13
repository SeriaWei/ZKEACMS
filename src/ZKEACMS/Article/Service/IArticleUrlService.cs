/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.Service
{
    public interface IArticleUrlService
    {
        string[] GetPublicUrl(int ID);
        string[] GetPublicUrl(ArticleEntity article);
        IEnumerable<ArticleUrl> GetAllPublicUrls();
        string[] GetDetailPages();
    }
}
