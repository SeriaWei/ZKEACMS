/* http://www.zkea.net/ Copyright 2017
 * ZKEASOFT 
 * http://www.zkea.net/licenses 
 */

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;
using Easy.RepositoryPattern;
using ZKEACMS.Shop.Models;

namespace ZKEACMS.Shop
{
    public class OrderDbContext : CMSDbContext
    {
        public OrderDbContext(IEnumerable<IOnModelCreating> modelCreatings, IOnDatabaseConfiguring configuring) : base(modelCreatings, configuring)
        {
        }
        internal DbSet<Basket> Basket { get; set; }
        internal DbSet<Order> Order { get; set; }
        internal DbSet<OrderItem> OrderItem { get; set; }
    }
}
