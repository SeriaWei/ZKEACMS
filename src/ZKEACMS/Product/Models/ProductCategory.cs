/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;

namespace ZKEACMS.Product.Models
{
    [DataTable("ProductCategory")]
    public class ProductCategory : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string Url { get; set; }
        public int ParentID { get; set; }
        public string SEOTitle { get; set; }
        public string SEOKeyWord { get; set; }
        public string SEODescription { get; set; }
    }
    class ProductCategoryMetaData : ViewMetaData<ProductCategory>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.ParentID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Order(1).MaxLength(200).Required();
            ViewConfig(m => m.Url).AsTextBox().Order(2).MaxLength(100).UrlPart();
            ViewConfig(m => m.Status).AsDropDownList().DataSource(DicKeys.RecordStatus, SourceType.Dictionary);
            ViewConfig(m => m.SEOTitle).AsTextBox().Order(4).MaxLength(100);
            ViewConfig(m => m.SEOKeyWord).AsTextBox().Order(5).MaxLength(100);
            ViewConfig(m => m.SEODescription).AsTextBox().Order(6).MaxLength(300);
        }
    }

}