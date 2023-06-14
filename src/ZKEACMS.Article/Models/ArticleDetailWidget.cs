/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.MetaData;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Models
{
    [DataTable("ArticleDetailWidget")]
    public class ArticleDetailWidget : BasicWidget
    {
        public string CustomerClass { get; set; }
    }
    class ArticleDetailWidgetMetaData : WidgetMetaData<ArticleDetailWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.Title).AsHidden(); ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.CustomerClass).AsHidden();
        }
    }

}