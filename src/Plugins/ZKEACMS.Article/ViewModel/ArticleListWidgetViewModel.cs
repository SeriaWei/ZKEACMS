/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System.Collections.Generic;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleListWidgetViewModel
    {
        public Pagination Pagin { get; set; }
        public string CategoryTitle { get; set; }
        public ArticleListWidget Widget { get; set; }
        public IEnumerable<ArticleEntity> Articles { get; set; }
        public int CurrentCategory { get; set; }
        public bool IsPageable { get; set; }
    }
}