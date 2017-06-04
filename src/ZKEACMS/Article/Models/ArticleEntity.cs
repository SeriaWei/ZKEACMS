/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Constant;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS.ExtendField;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ZKEACMS.Article.Models
{
    [ViewConfigure(typeof(ArticleEntityMeta)), Table("Article")]
    public class ArticleEntity : EditorEntity, IImage
    {
        [Key]
        public int ID { get; set; }

        public string Summary { get; set; }
        public string MetaKeyWords { get; set; }
        public string MetaDescription { get; set; }
        public int? Counter { get; set; }
        public string ArticleContent { get; set; }

        public string ImageThumbUrl { get; set; }

        public string ImageUrl { get; set; }

        public int? ArticleTypeID { get; set; }
        public DateTime? PublishDate { get; set; }
        public bool IsPublish { get; set; }        
    }
    class ArticleEntityMeta : ViewMetaData<ArticleEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Required().Order(1).ShowInGrid().Search(Easy.LINQ.Query.Operators.Contains);
            ViewConfig(m => m.Status).AsDropDownList().DataSource(DicKeys.RecordStatus, SourceType.Dictionary);
            ViewConfig(m => m.ImageThumbUrl).AsTextBox().AddClass(StringKeys.SelectImageClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.ImageUrl).AsTextBox().AddClass(StringKeys.SelectImageClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.ArticleTypeID)
                .AsDropDownList()
                .DataSource(ViewDataKeys.ArticleCategory, SourceType.ViewData)
                .Required()
                .AddClass("select")
                .AddProperty("data-url", "/admin/ArticleType/Select")
                .ShowInGrid();

            ViewConfig(m => m.ArticleContent).AsTextArea().AddClass(StringKeys.HtmlEditorClass);
            ViewConfig(m => m.PublishDate).AsTextBox().Hide();
            ViewConfig(m => m.IsPublish).AsTextBox().Hide().ShowInGrid();
        }
    }

}