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
    public interface IProductApiService
    {
        ProductEntity Get(int id);
        ProductEntity GetByName(string name);
        ErrorOr<ProductEntity> Create(ProductEntity product);
        ErrorOr<ProductEntity> Update(ProductEntity product);
        ProductEntity Publish(int id);
        void Delete(int id);
    }
}
