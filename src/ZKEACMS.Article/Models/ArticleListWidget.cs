/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.MetaData;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using System.Linq;
using ZKEACMS.Article.Service;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.Article.Models
{
    [DataTable("ArticleListWidget")]
    public class ArticleListWidget : BasicWidget
    {
        public int ArticleTypeID { get; set; }
        public string DetailPageUrl { get; set; }
        public bool IsPageable { get; set; }
        public int? PageSize { get; set; }
    }
    class ArticleListWidgetMeta : WidgetMetaData<ArticleListWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();

            ViewConfig(m => m.ArticleTypeID).AsDropDownList().Order(NextOrder()).SetTemplate("ArticleTypeTree").Required();

            ViewConfig(m => m.DetailPageUrl).AsTextBox().Order(NextOrder()).PageSelector();

            ViewConfig(m => m.IsPageable).AsCheckBox().Order(NextOrder());
            ViewConfig(m => m.PageSize).AsTextBox().Order(NextOrder()).Range(1, 50);

            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary);
        }
    }

}