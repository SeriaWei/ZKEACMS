using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;
using Microsoft.EntityFrameworkCore;
using Easy;
using ZKEACMS.Shop.Filter;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Shop.Service
{
    public class BasketService : ServiceBase<Basket>, IBasketService
    {
        private readonly IProductService _productService;
        private readonly IOrderService _orderService;
        private readonly IOrderItemService _orderItemService;
        public BasketService(IApplicationContext applicationContext, IProductService productService, IOrderService orderService, IOrderItemService orderItemService, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productService = productService;
            _orderService = orderService;
            _orderItemService = orderItemService;
        }
        
        public override IQueryable<Basket> Get()
        {
            if (ApplicationContext.CurrentCustomer != null)
            {
                return base.Get().Where(m => m.UserId == ApplicationContext.CurrentCustomer.UserID);
            }
            return null;
        }
        public override Basket Get(params object[] primaryKey)
        {
            if (ApplicationContext.CurrentCustomer != null)
            {
                var basket = base.Get(primaryKey);
                if (ApplicationContext.CurrentCustomer.UserID == basket.UserId)
                {
                    return basket;
                }
            }
            return null;
        }
        public override ServiceResult<Basket> Add(Basket item)
        {
            if (ApplicationContext.CurrentCustomer != null)
            {
                var baskets = Get(m => m.UserId == ApplicationContext.CurrentCustomer.UserID && m.ProductId == item.ProductId);
                var product = _productService.Get(item.ProductId);
                if (baskets.Any(m => m.Description == item.Description) && product != null)
                {
                    foreach (var basket in baskets.Where(m => m.Description == item.Description))
                    {
                        basket.Quantity += item.Quantity;
                        base.Update(basket);
                    }

                }
                else
                {
                    item.ImageUrl = product.ImageThumbUrl ?? product.ImageUrl;
                    item.Title = product.Title;
                    item.UserId = ApplicationContext.CurrentCustomer.UserID;
                    item.Price = product.RebatePrice ?? product.Price ?? 0;
                    base.Add(item);
                }
            }
            return new ServiceResult<Basket>();
        }
        public override ServiceResult<Basket> Update(Basket item)
        {
            if (ApplicationContext.CurrentCustomer != null && ApplicationContext.CurrentCustomer.UserID == item.UserId)
            {
                base.Update(item);
            }
            return new ServiceResult<Basket>();
        }
        public override void Remove(Basket item)
        {
            if (ApplicationContext.CurrentCustomer != null && ApplicationContext.CurrentCustomer.UserID == item.UserId)
            {
                base.Remove(item);
            }
        }

        public Order CheckOut(Order order)
        {
            if (ApplicationContext.CurrentCustomer != null)
            {
                var baskets = Get().ToList();
                if (!baskets.Any())
                {
                    return order;
                }
                order.UserId = ApplicationContext.CurrentCustomer.UserID;
                order.OrderStatus = (int)OrderStatus.UnPaid;
                order.Total = baskets.Sum(m => m.Price * m.Quantity);
                _orderService.Add(order);
                foreach (var item in baskets)
                {
                    _orderItemService.Add(item.ToOrderItem(order.ID));
                }
                RemoveRange(baskets.ToArray());
            }
            return order;
        }
    }
}
