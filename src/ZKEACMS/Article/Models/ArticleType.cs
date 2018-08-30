/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;

namespace ZKEACMS.Article.Models
{
    [Table("ArticleType")]
    public class ArticleType : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string Url { get; set; }
        public int? ParentID { get; set; }
    }
    class ArtycleTypeMetaData : ViewMetaData<ArticleType>
    {

        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.ParentID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Order(1).MaxLength(200).Required();
            ViewConfig(m => m.Url).AsTextBox().Order(2).MaxLength(100).UrlPart();
            ViewConfig(m => m.Status).AsDropDownList().DataSource(DicKeys.RecordStatus, SourceType.Dictionary);
        }
    }

}