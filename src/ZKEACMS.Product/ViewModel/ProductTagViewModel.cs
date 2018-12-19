using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.ViewModel
{
    public class ProductTagViewModel
    {
        public IList<ProductCategoryTag> ProductTags { get; set; }
    }
}
