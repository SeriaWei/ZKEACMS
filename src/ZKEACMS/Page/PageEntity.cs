/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Constant;
using Easy.Extend;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS.ExtendField;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ZKEACMS.Page
{
    [Table("CMS_Page")]
    public class PageEntity : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public string ReferencePageID { get; set; }
        public bool IsPublishedPage { get; set; }
        public string ParentId { get; set; }
        public string Url { get; set; }
        private string _pageUrl;
        [NotMapped]
        public string PageUrl
        {
            get
            {
                if (_pageUrl.IsNotNullAndWhiteSpace()) return _pageUrl;
                if (!Url.IsNullOrEmpty())
                {
                    return Url.Substring(Url.LastIndexOf("/") + 1, Url.Length - Url.LastIndexOf("/") - 1);
                }
                return Url;
            }
            set { _pageUrl = value; }
        }
        public int? DisplayOrder { get; set; }
        public string LayoutId { get; set; }
        public string PageName { get; set; }
        public string Content { get; set; }
        public string MetaKeyWorlds { get; set; }
        public string MetaDescription { get; set; }
        public string Script { get; set; }
        public string Style { get; set; }
        public bool IsHomePage { get; set; }

        public DateTime? PublishDate { get; set; }
        public bool IsPublish { get; set; }
        [NotMapped]
        public string Favicon { get; set; }
    }
    class PageMetaData : ViewMetaData<PageEntity>
    {

        protected override void ViewConfigure()
        {
            ViewConfig(m => m.PageName).AsTextBox().Order(1).Required();
            ViewConfig(m => m.PageUrl).AsTextBox().Order(2).Required();
            ViewConfig(m => m.Url).AsTextBox().ReadOnly();
            //ViewConfig(m => m.LayoutId).AsDropDownList().DataSource(ViewDataKeys.Layouts, SourceType.ViewData);
            ViewConfig(m => m.LayoutId).AsTextBox().SetTemplate("LayoutChooser");
            ViewConfig(m => m.Script).AsTextBox().AddClass(StringKeys.SelectMediaClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.Style).AsTextBox().AddClass(StringKeys.SelectMediaClass).AddProperty("data-url", Urls.SelectMedia);
            
            ViewConfig(m => m.ParentId).AsHidden();
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.DisplayOrder).AsHidden();
            ViewConfig(m => m.ReferencePageID).AsHidden();
            ViewConfig(m => m.Content).AsHidden();
            ViewConfig(m => m.IsHomePage).AsHidden();
            ViewConfig(m => m.PublishDate).AsTextBox().Hide();
            ViewConfig(m => m.IsPublish).AsTextBox().Hide();
            ViewConfig(m => m.IsPublishedPage).AsTextBox().Hide();
            ViewConfig(m => m.Favicon).AsHidden().Ignore();
        }
    }

}
