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
    public class OrderItemService : ServiceBase<OrderItem>, IOrderItemService
    {
        public OrderItemService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        
    }
}
