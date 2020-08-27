/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
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
