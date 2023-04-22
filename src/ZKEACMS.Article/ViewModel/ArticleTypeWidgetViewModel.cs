/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.Article.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleTypeWidgetViewModel
    {
        public WidgetBase Widget { get; set; }
        public IEnumerable<ArticleType> ArticleTypes { get; set; }
        public int ArticleTypeID { get; set; }
    }
}