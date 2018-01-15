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
    public class OrderService : ServiceBase<Order>, IOrderService
    {
        private readonly IOrderItemService _orderItemService;
        public OrderService(IApplicationContext applicationContext, IOrderItemService orderItemService, OrderDbContext dbContext) : base(applicationContext, dbContext)
        {
            _orderItemService = orderItemService;
        }

        public override DbSet<Order> CurrentDbSet => (DbContext as OrderDbContext).Order;
        public override ServiceResult<Order> Add(Order item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            return base.Add(item);
        }

        public void BeginPay(Order order)
        {
            order.OrderStatus = (int)OrderStatus.UnPaid;
            order.PayTime = DateTime.Now;
            Update(order);
        }

        public void CompletePay(Order order, string paymentGateway, string paymentID)
        {
            order.OrderStatus = (int)OrderStatus.Paid;
            order.CompletePayTime = DateTime.Now;
            order.PaymentGateway = paymentGateway;
            order.PaymentID = paymentID;
            Update(order);
        }
        public override void Remove(Order item, bool saveImmediately = true)
        {
            _orderItemService.Remove(m => m.OrderId == item.ID);
            base.Remove(item, saveImmediately);
        }
    }
}
