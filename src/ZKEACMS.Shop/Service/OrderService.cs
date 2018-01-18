using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;
using Microsoft.EntityFrameworkCore;
using Easy;
using Easy.Extend;

namespace ZKEACMS.Shop.Service
{
    public class OrderService : ServiceBase<Order>, IOrderService
    {
        private readonly IOrderItemService _orderItemService;
        private readonly IEnumerable<IPaymentService> _paymentServices;
        public OrderService(IApplicationContext applicationContext, IOrderItemService orderItemService, IEnumerable<IPaymentService> paymentServices, OrderDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _orderItemService = orderItemService;
            _paymentServices = paymentServices;
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

        public void CloseOrder(string orderId)
        {
            throw new NotImplementedException();
        }

        public void CompletePay(Order order, string paymentGateway, string paymentID)
        {
            order.OrderStatus = (int)OrderStatus.Paid;
            order.CompletePayTime = DateTime.Now;
            order.PaymentGateway = paymentGateway;
            order.PaymentID = paymentID;
            Update(order);
        }

        public PaymentInfo GetPaymentInfo(string orderId)
        {
            var order = Get(orderId);
            if (order != null && order.PaymentID.IsNotNullAndWhiteSpace())
            {
                return _paymentServices.First(m => m.Getway == order.PaymentGateway).GetPaymentInfo(order);
            }
            return null;
        }

        public RefundInfo GetRefund(string orderId)
        {
            throw new NotImplementedException();
        }

        public void Refund(string orderId, decimal amount, string reason)
        {
            var order = Get(orderId);
            if (order != null && order.PaymentID.IsNotNullAndWhiteSpace() && order.RefundID.IsNullOrEmpty() && amount <= order.Total)
            {
                order.Refund = amount;
                order.RefundDate = DateTime.Now;
                order.RefundReason = reason;
                if (_paymentServices.First(m => m.Getway == order.PaymentGateway).Refund(order))
                {
                    Update(order);
                }
            }
        }

        public override void Remove(Order item, bool saveImmediately = true)
        {
            _orderItemService.Remove(m => m.OrderId == item.ID);
            base.Remove(item, saveImmediately);
        }
    }
}
