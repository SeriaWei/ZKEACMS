/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.ViewModel
{
    public class ProductGalleryWidgetViewModel
    {
        public string DetailPageUrl { get; set; }
        public IEnumerable<ProductEntity> Products { get; set; }
    }
}
