/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ZKEACMS.Extend;

namespace ZKEACMS.Product.Models
{
    [Table("ProductImage")]
    public class ProductImage : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public int ProductId { get; set; }
        public string ImageUrl { get; set; }
    }
    class ProductImageMetaData : ViewMetaData<ProductImage>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.ProductId).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            
            ViewConfig(m => m.ImageUrl).AsTextBox().Required().MediaSelector();
        }
    }
}
