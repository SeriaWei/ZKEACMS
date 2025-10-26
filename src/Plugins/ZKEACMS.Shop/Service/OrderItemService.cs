/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;
using Microsoft.EntityFrameworkCore;
using Easy;

namespace ZKEACMS.Shop.Service
{
    public class OrderItemService : ServiceBase<OrderItem, CMSDbContext>, IOrderItemService
    {
        public OrderItemService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        
    }
}
