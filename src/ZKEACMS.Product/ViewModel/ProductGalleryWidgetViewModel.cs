/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
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
