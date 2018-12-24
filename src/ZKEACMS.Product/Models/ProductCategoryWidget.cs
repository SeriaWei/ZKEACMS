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
using Easy.RepositoryPattern;

namespace ZKEACMS.Product.Models
{
    [DataTable("ProductCategoryWidget")]
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
            ViewConfig(m => m.ProductCategoryID).AsDropDownList().Order(NextOrder()).SetTemplate("ProductCategoryTree").Required();
            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary).Required();
            ViewConfig(m => m.TargetPage).AsHidden();
        }
    }
}