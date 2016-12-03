/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using ZKEACMS.Article.Models;
using Easy.Web.CMS.Article.Models;

namespace ZKEACMS.Article.ViewModel
{
    public class ArticleTopWidgetViewModel
    {
        public IEnumerable<ArticleEntity> Articles { get; set; }
        public ArticleTopWidget Widget { get; set; }
    }
}