/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Linq;
using Easy.MetaData;
using ZKEACMS.Widget;
using ZKEACMS.MetaData;
using ZKEACMS.Product.Service;
using Easy;
using Microsoft.Extensions.DependencyInjection;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.Constant;

namespace ZKEACMS.Product.Models
{
    [ViewConfigure(typeof(ProductCategoryWidgetMedata)), Table("ProductCategoryWidget")]
    public class ProductCategoryWidget : BasicWidget
    {
        public int ProductCategoryID { get; set; }
        public string TargetPage { get; set; }
    }

    class ProductCategoryWidgetMedata : WidgetMetaData<ProductCategoryWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.ProductCategoryID).AsDropDownList().Order(NextOrder()).DataSource(() =>
            {
                return ServiceLocator.GetService<IProductCategoryService>().GetAll().ToDictionary(m => m.ID.ToString(), m => m.Title);
            }).Required().AddClass("select").AddProperty("data-url", "/admin/ProductCategory/Select"); ;
            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary).Required();
            ViewConfig(m => m.TargetPage).AsHidden();
        }
    }
}