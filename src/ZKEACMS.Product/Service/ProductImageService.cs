/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Product.Service
{
    public class ProductImageService : ServiceBase<ProductImage>, IProductImageService
    {
        public ProductImageService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
    }
}
