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
        public OrderService(IApplicationContext applicationContext, IOrderItemService orderItemService, IEnumerable<IPaymentService> paymentServices, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _orderItemService = orderItemService;
            _paymentServices = paymentServices;
        }
        
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

        public ServiceResult<bool> CloseOrder(string orderId)
        {
            var order = Get(orderId);
            if (order != null && order.OrderStatus == (int)OrderStatus.UnPaid)
            {
                var serviceResult = _paymentServices.First(m => m.Getway == order.PaymentGateway).CloseOrder(order);
                if (serviceResult.Result)
                {
                    order.OrderStatus = (int)OrderStatus.Cancel;
                    Update(order);
                }
                return serviceResult;
            }
            ServiceResult<bool> result = new ServiceResult<bool>();
            result.Result = false;
            result.RuleViolations.Add(new RuleViolation("Error", "只能关闭未支付的订单"));
            return result;
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
            var order = Get(orderId);
            if (order != null && order.RefundID.IsNotNullAndWhiteSpace())
            {
                return _paymentServices.First(m => m.Getway == order.PaymentGateway).GetRefund(order);
            }
            return null;
        }

        public ServiceResult<bool> Refund(string orderId, decimal amount, string reason)
        {
            var order = Get(orderId);
            if (order != null && order.PaymentID.IsNotNullAndWhiteSpace() && order.RefundID.IsNullOrEmpty() && amount <= order.Total)
            {
                order.Refund = amount;
                order.RefundDate = DateTime.Now;
                order.RefundReason = reason;
                var result = _paymentServices.First(m => m.Getway == order.PaymentGateway).Refund(order);
                if (result.Result)
                {
                    order.OrderStatus = (int)OrderStatus.Refund;
                    Update(order);
                }
                return result;
            }
            ServiceResult<bool> failed = new ServiceResult<bool>();
            failed.Result = false;
            if (order.PaymentID.IsNullOrEmpty())
            {
                failed.RuleViolations.Add(new RuleViolation("Error", "退款失败，订单未付款"));
            }
            if (order.RefundID.IsNotNullAndWhiteSpace())
            {
                failed.RuleViolations.Add(new RuleViolation("Error", "退款失败，订单已退款"));
            }
            if (amount > order.Total)
            {
                failed.RuleViolations.Add(new RuleViolation("Error", "退款失败，退款金额超出订单金额"));
            }
            return failed;
        }

        public override void Remove(Order item)
        {
            _orderItemService.Remove(m => m.OrderId == item.ID);
            base.Remove(item);
        }
    }
}
