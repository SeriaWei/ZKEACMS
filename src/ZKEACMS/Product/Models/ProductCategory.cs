/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Product.Models
{
    [ViewConfigure(typeof(ProductCategoryMetaData)), Table("ProductCategory")]
    public class ProductCategory : EditorEntity
    {
        [Key]
        public int ID { get; set; }

        public int ParentID { get; set; }
    }
    class ProductCategoryMetaData : ViewMetaData<ProductCategory>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.ParentID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().MaxLength(200).Required();
            ViewConfig(m => m.Status).AsDropDownList().DataSource(DicKeys.RecordStatus, SourceType.Dictionary);
        }
    }

}