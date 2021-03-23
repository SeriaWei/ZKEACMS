/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */


using Easy;
using Easy.RepositoryPattern;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;

namespace ZKEACMS.Product.Service
{
    public class ProductGalleryService : ServiceBase<ProductGallery>, IProductGalleryService
    {
        private readonly IProductService _productService;
        public ProductGalleryService(IApplicationContext applicationContext, CMSDbContext dbContext, IProductService productService) : base(applicationContext, dbContext)
        {
            _productService = productService;
        }

        public override ProductGallery Get(params object[] primaryKey)
        {
            var gallery = base.Get(primaryKey);
            if (gallery != null)
            {
                var productIds = gallery.Products.Where(m => m.Product != null).Select(m => m.Product.ProductID).ToArray();
                if (productIds.Length > 0)
                {
                    var products = _productService.Get(m => productIds.Contains(m.ID));
                    foreach (var item in gallery.Products.Where(m => m.Product != null))
                    {
                        item.Product.Title = products.FirstOrDefault(m => m.ID == item.Product.ProductID)?.Title;
                    }
                }
            }
            return gallery;
        }
    }
}
