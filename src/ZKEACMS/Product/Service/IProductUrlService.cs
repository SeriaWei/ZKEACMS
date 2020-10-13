/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public interface IProductUrlService
    {
        string[] GetPublicUrl(int ID);
        string[] GetPublicUrl(ProductEntity product);
        IEnumerable<ProductUrl> GetAllPublicUrls();
        string[] GetDetailPages();
    }
}
