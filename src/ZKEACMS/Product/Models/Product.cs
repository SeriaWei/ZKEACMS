/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Constant;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS.ExtendField;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ZKEACMS.Product.Models
{
    [ViewConfigure(typeof(ProductMetaData)), Table("Product")]
    public class ProductEntity : EditorEntity, IImage, IExtendField
    {
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
        public int? ProductCategoryID { get; set; }
        /// <summary>
        /// 颜色
        /// </summary>
        public string Color { get; set; }
        /// <summary>
        /// 销售价格
        /// </summary>
        public decimal? Price { get; set; }
        /// <summary>
        /// 折扣价格
        /// </summary>
        public decimal? RebatePrice { get; set; }
        /// <summary>
        /// 进价，成本价
        /// </summary>
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

        public IEnumerable<ExtendFieldEntity> ExtendFields { get; set; }

    }
    class ProductMetaData : ViewMetaData<ProductEntity>
    {

        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Required().Order(0).ShowInGrid();
            ViewConfig(m => m.ImageUrl).AsTextBox().AddClass(StringKeys.SelectImageClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.ImageThumbUrl).AsTextBox().AddClass(StringKeys.SelectImageClass).AddProperty("data-url", Urls.SelectMedia);
            ViewConfig(m => m.BrandCD).AsHidden();
            ViewConfig(m => m.ProductCategoryID).AsDropDownList().Required().DataSource(ViewDataKeys.ProductCategory, SourceType.ViewData);
            ViewConfig(m => m.ExtendFields).AsListEditor();
            ViewConfig(m => m.ShelfLife).AsHidden();
            ViewConfig(m => m.Norm).AsHidden();
            ViewConfig(m => m.Color).AsHidden();
            ViewConfig(m => m.PurchasePrice).AsHidden();
            ViewConfig(m => m.ProductContent).AsTextArea().AddClass("html");
            ViewConfig(m => m.Description).AsTextArea();
            ViewConfig(m => m.IsPublish).AsTextBox().Hide();
        }
    }

}
