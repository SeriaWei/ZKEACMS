using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;

namespace ZKEACMS.Shop.ViewModel
{
    public class OrderDetailViewModel
    {
        public Order Order { get; set; }
        public IList<OrderItem> OrderItems { get; set; }
    }
}
