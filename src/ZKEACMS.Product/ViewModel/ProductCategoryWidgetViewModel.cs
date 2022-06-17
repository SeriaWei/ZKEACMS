/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.ViewModel
{
    public class ProductCategoryWidgetViewModel
    {
        public IEnumerable<ProductCategory> Categorys { get; set; }
        public int CurrentCategory { get; set; }
    }
}