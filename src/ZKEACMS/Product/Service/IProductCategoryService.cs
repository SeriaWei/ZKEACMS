/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.RepositoryPattern;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public interface IProductCategoryService : IService<ProductCategory>
    {
        IEnumerable<ProductCategory> GetChildren(long id);
        ProductCategory GetByUrl(string url);
    }
}