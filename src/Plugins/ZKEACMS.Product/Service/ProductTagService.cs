/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using Easy;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Product.Service
{
    public class ProductTagService : ServiceBase<ProductTag, CMSDbContext>, IProductTagService
    {
        public ProductTagService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        
    }
}
