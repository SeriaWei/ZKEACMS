/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Product.Models
{
    public class ProductGalleryItem : EditorEntity
    {
        public ProductItem Product { get; set; }
    }
    class ProductGalleryItemMetaData : ViewMetaData<ProductGalleryItem>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.Product).AsProductSelector();
        }
    }
}
