/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Product.Models
{
    public class ProductItem
    {
        public string Title { get; set; }
        public int ProductID { get; set; }
    }
    class ProductGalleryProductMetaData : ViewMetaData<ProductItem>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ProductID).AsHidden().Required();
            ViewConfig(m => m.Title).AsTextBox().Required();
        }
    }
}
