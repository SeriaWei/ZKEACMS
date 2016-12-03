/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public class ProductService : ServiceBase<ProductEntity>, IProductService
    {
        public void Publish(long ID)
        {
            var product = Get(ID);
            product.IsPublish = true;
            Update(product);
        }
    }
}
