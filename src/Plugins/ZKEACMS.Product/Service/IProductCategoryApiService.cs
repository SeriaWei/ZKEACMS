/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public interface IProductCategoryApiService
    {
        ProductCategory Get(int id);
        ProductCategory GetByName(string name);
        ErrorOr<ProductCategory> Create(ProductCategory productCategory);
        ErrorOr<ProductCategory> Update(ProductCategory productCategory);
        void Delete(int id);
    }
}
