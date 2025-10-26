/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System.Collections.Generic;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.ViewModel
{
    public class ProductListWidgetViewModel
    {
        public Pagination Page { get; set; }
        public IEnumerable<ProductEntity> Products { get; set; }
        public string Columns { get; set; }
        public string DetailPageUrl { get; set; }
        public bool IsPageable { get; set; }
    }
}