/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using ZKEACMS.Widget;
using ZKEACMS.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.RepositoryPattern;

namespace ZKEACMS.Sitemap.Models
{
    [DataTable("ProductDetailWidget")]
    public class ProductDetailWidget : BasicWidget
    {
        public string CustomerClass { get; set; }
    }
}