using Easy.RepositoryPattern;
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
        ServiceResult<ProductEntity> Create(ProductEntity product);
        ServiceResult<ProductEntity> Update(ProductEntity product);
        ProductEntity Publish(int id);
        void Delete(int id);
    }
}
