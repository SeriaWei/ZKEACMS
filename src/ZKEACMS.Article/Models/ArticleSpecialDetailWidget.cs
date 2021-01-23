/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.Constant;
using Easy.MetaData;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;


namespace ZKEACMS.Article.Models
{
    public class ArticleSpecialDetailWidget : SimpleWidgetBase
    {
        /// <summary>
        ///  对应Article的ID字段
        /// </summary>
        public int? ArticleId { get; set; }

        /// <summary>
        /// 对应Article的URL字段
        /// </summary>
        public string ArticleName { get; set; }
    }

    class ArticleSpecialDetailWidgetMetaData : WidgetMetaData<ArticleSpecialDetailWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();

            ViewConfig(m => m.ArticleId).AsTextBox().Required().RegularExpression(RegularExpression.Integer);
            ViewConfig(m => m.ArticleName).AsHidden();
        }
    }
}
