/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.IO;
using Easy.Extend;
using Easy.MetaData;
using ZKEACMS.Widget;
using ZKEACMS.MetaData;
using Easy;
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.Product.Service;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.Constant;
using System.Linq;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.Product.Models
{
    [DataTable("ProductListWidget")]
    public class ProductListWidget : BasicWidget
    {
        public bool IsPageable { get; set; }
        public int ProductCategoryID { get; set; }
        public string DetailPageUrl { get; set; }
        public string Columns { get; set; }
        public int? PageSize { get; set; }
    }

    class ProductListWidgetMetaData : WidgetMetaData<ProductListWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.ProductCategoryID).AsDropDownList().SetTemplate("ProductCategoryTree").Required().Order(NextOrder());

            ViewConfig(m => m.DetailPageUrl).AsTextBox().Order(NextOrder()).PageSelector();
            ViewConfig(m => m.IsPageable).AsCheckBox().Order(NextOrder());
            ViewConfig(m => m.PageSize).AsTextBox().Order(NextOrder()).Range(1, 50);
            ViewConfig(m => m.Columns).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary);
            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary);
        }
    }

}