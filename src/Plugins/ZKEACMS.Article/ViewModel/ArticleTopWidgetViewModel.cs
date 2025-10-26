/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleTopWidgetViewModel
    {
        public IEnumerable<ArticleEntity> Articles { get; set; }
        public ArticleTopWidget Widget { get; set; }
    }
}