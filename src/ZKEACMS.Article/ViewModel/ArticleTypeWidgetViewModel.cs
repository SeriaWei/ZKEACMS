/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.Web.CMS.Article.Models;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleTypeWidgetViewModel
    {
        public ArticleType CurrentType { get; set; }
        public IEnumerable<ArticleType> ArticleTypes { get; set; }
        public string TargetPage { get; set; }
        public int ArticleTypeID { get; set; }
    }
}