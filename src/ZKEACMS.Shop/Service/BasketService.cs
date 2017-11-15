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
            if (ApplicationContext.CurrentUser != null)
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
                    basket.ImageUrl = product.ImageThumbUrl;
                    basket.Title = product.Title;
                    base.Update(basket);
                }
                else
                {
                    item.UserId = ApplicationContext.CurrentCustomer.UserID;
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
