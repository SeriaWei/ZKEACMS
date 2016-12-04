/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using ZKEACMS.Article.Models;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleDetailViewModel
    {
        public ArticleEntity Current { get; set; }
        public ArticleEntity Prev { get; set; }
        public ArticleEntity Next { get; set; }
    }
}