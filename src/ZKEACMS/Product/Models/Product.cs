/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Constant;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS.ExtendField;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Easy.LINQ;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.Product.Models
{
    [DataTable("Product")]
    public class ProductEntity : EditorEntity, IImage
    {
        public ProductEntity()
        {
            ProductImages = new List<ProductImage>();
        }

        [Key]
        public int ID { get; set; }
        /// <summary>
        /// 产品图
        /// </summary>
        public string ImageUrl { get; set; }
        /// <summary>
        /// 产品缩略图
        /// </summary>
        public string ImageThumbUrl { get; set; }
        /// <summary>
        /// 品牌
        /// </summary>
        public int? BrandCD { get; set; }
        /// <summary>
        /// 类别
        /// </summary>
        public int ProductCategoryID { get; set; }

        public string PartNumber { get; set; }
        /// <summary>
        /// 颜色
        /// </summary>
        public string Color { get; set; }
        /// <summary>
        /// 销售价格
        /// </summary>
        [Column(TypeName = "decimal(18,4)")]
        public decimal? Price { get; set; }
        /// <summary>
        /// 折扣价格
        /// </summary>
        [Column(TypeName = "decimal(18,4)")]
        public decimal? RebatePrice { get; set; }
        /// <summary>
        /// 进价，成本价
        /// </summary>
        [Column(TypeName = "decimal(18,4)")]
        public decimal? PurchasePrice { get; set; }
        /// <summary>
        /// 规格
        /// </summary>
        public string Norm { get; set; }
        /// <summary>
        /// 保质期
        /// </summary>
        public string ShelfLife { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string ProductContent { get; set; }

        public string SEOTitle { get; set; }
        public string SEOKeyWord { get; set; }
        public string SEODescription { get; set; }
        public int? OrderIndex { get; set; }
        public string SourceFrom { get; set; }
        public string Url { get; set; }
        public bool IsPublish { get; set; }
        public DateTime? PublishDate { get; set; }
        public string TargetFrom { get; set; }
        public string TargetUrl { get; set; }
        [NotMapped]
        public IList<ProductCategoryTag> ProductTags { get; set; }
        [NotMapped]
        public IList<ProductImage> ProductImages { get; set; }

    }
    class ProductMetaData : ViewMetaData<ProductEntity>
    {

        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.TargetFrom).AsHidden();
            ViewConfig(m => m.TargetUrl).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Required().Order(0).ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.Url).AsTextBox().Order(1).MaxLength(100).UrlPart().Required();
            ViewConfig(m => m.ImageUrl).AsTextBox().Required().MediaSelector();
            ViewConfig(m => m.ImageThumbUrl).AsTextBox().Required().MediaSelector();
            ViewConfig(m => m.PartNumber).AsTextBox().ShowInGrid().Search(Query.Operators.Contains);
            ViewConfig(m => m.BrandCD).AsHidden();
            ViewConfig(m => m.ProductCategoryID)
                .AsDropDownList()
                .Required()
                .DataSource(ViewDataKeys.ProductCategory, SourceType.ViewData)
                .SetTemplate("ProductCategoryTree")
                .ShowInGrid();

            ViewConfig(m => m.ProductTags).AsTextBox().SetTemplate("TagSelector");
            ViewConfig(m => m.ProductImages).AsListEditor();

            ViewConfig(m => m.ProductContent).AsTextArea().AddClass("html");
            ViewConfig(m => m.Description).AsTextArea();
            ViewConfig(m => m.IsPublish).AsTextBox().Hide();
        }
    }

}
