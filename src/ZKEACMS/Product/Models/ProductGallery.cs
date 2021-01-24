/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using ZKEACMS.Extend;

namespace ZKEACMS.Product.Models
{
    [DataTable("ProductGallery")]
    public class ProductGallery : EditorEntity
    {
        public ProductGallery()
        {
            Products = new List<ProductGalleryItem>();
        }
        [Key]
        public int ID { get; set; }

        [NotMapped]
        public List<ProductGalleryItem> Products { get; set; }
        public string RawData
        {
            get { return JsonSerializer.Serialize(Products.RemoveDeletedItems()); }
            set { Products = JsonSerializer.Deserialize<List<ProductGalleryItem>>(value); }
        }
    }
    class ProductGalleryMetaData : ViewMetaData<ProductGallery>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.RawData).AsHidden().Ignore();

            ViewConfig(m => m.Title).AsTextBox().Required().Order(1).MaxLength(200).ShowInGrid();
            ViewConfig(m => m.Products).AsListEditor().Order(2).Sortable();
        }
    }
}
