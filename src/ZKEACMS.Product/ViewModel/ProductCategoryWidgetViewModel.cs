/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.Product.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Product.ViewModel
{
    public class ProductCategoryWidgetViewModel
    {
        public WidgetBase Widget { get; set; }
        public IEnumerable<ProductCategory> Categorys { get; set; }
        public int CurrentCategory { get; set; }
    }
}