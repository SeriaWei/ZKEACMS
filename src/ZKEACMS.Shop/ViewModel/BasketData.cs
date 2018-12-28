using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;

namespace ZKEACMS.Shop.ViewModel
{
    public class BasketData
    {
        public BasketData(IQueryable<Basket> baskets)
        {
            if (baskets != null)
            {
                Basket = baskets.ToList();
            }
        }
        public IList<Basket> Basket { get; set; }
        public int Quantity
        {
            get
            {
                if (Basket == null) return 0;
                return Basket.Sum(m => m.Quantity);
            }
        }
        public decimal Total
        {
            get
            {
                if (Basket == null) return 0;
                return Basket.Sum(m => m.Price * m.Quantity);
            }
        }
    }
}
