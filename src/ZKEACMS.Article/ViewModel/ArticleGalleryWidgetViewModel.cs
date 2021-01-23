/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleGalleryWidgetViewModel
    {
        public string DetailPageUrl { get; set; }
        public IEnumerable<ArticleEntity> Articles { get; set; }
    }
}
