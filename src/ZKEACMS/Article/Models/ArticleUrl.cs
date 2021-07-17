/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Article.Models
{
    public class ArticleUrl
    {
        public string Url { get; set; }
        public ArticleEntity Article { get; set; }
    }
}
