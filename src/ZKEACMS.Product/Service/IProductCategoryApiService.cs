using Easy.RepositoryPattern;
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
        ServiceResult<ProductCategory> Create(ProductCategory productCategory);
        ServiceResult<ProductCategory> Update(ProductCategory productCategory);
        void Delete(int id);
    }
}
