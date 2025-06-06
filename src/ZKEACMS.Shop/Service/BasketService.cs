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
using ZKEACMS.Shop.Filter;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Shop.Service
{
    public class BasketService : ServiceBase<Basket, CMSDbContext>, IBasketService
    {
        private readonly IProductService _productService;
        private readonly IOrderService _orderService;
        public BasketService(IApplicationContext applicationContext, IProductService productService, IOrderService orderService, CMSDbContext dbContext) 
            : base(applicationContext, dbContext)
        {
            _productService = productService;
            _orderService = orderService;
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
        public override ErrorOr<Basket> Add(Basket item)
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
            return new ErrorOr<Basket>();
        }
        public override ErrorOr<Basket> Update(Basket item)
        {
            if (ApplicationContext.CurrentCustomer != null && ApplicationContext.CurrentCustomer.UserID == item.UserId)
            {
                base.Update(item);
            }
            return new ErrorOr<Basket>();
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
                order.Total = baskets.Sum(m => m.Price * m.Quantity);
                order.OrderItems = baskets.Select(m => m.ToOrderItem()).ToList();
                _orderService.Add(order);                
                RemoveRange(baskets.ToArray());
            }
            return order;
        }
    }
}
