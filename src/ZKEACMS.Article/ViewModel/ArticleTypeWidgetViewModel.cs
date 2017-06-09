/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleTypeWidgetViewModel
    {
        public IEnumerable<ArticleType> ArticleTypes { get; set; }
        public int ArticleTypeID { get; set; }
    }
}