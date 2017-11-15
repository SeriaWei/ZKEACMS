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
        public BasketService(IApplicationContext applicationContext, IProductService productService, OrderDbContext dbContext) : base(applicationContext, dbContext)
        {
            _productService = productService;
        }

        public override DbSet<Basket> CurrentDbSet => (DbContext as OrderDbContext).Basket;
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
        public override void Add(Basket item)
        {
            if (ApplicationContext.CurrentCustomer != null)
            {
                var basket = Get(m => m.UserId == ApplicationContext.CurrentCustomer.UserID && m.ProductId == item.ProductId).FirstOrDefault();
                var product = _productService.Get(item.ProductId);
                if (basket != null && product != null)
                {
                    basket.Quantity += item.Quantity;
                    base.Update(basket);
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
        }
        public override void Update(Basket item, bool saveImmediately = true)
        {
            if (ApplicationContext.CurrentCustomer != null && ApplicationContext.CurrentCustomer.UserID == item.UserId)
            {
                base.Update(item, saveImmediately);
            }
        }
        public override void Remove(Basket item, bool saveImmediately = true)
        {
            if (ApplicationContext.CurrentCustomer != null && ApplicationContext.CurrentCustomer.UserID == item.UserId)
            {
                base.Remove(item, saveImmediately);
            }
        }
    }
}
