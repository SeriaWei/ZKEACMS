using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;
using Microsoft.EntityFrameworkCore;
using Easy;
using Easy.Extend;
using ZKEACMS.Event;

namespace ZKEACMS.Shop.Service
{
    public class OrderService : ServiceBase<Order, CMSDbContext>, IOrderService
    {
        private readonly IOrderItemService _orderItemService;
        private readonly IEnumerable<IPaymentService> _paymentServices;
        private readonly ILocalize _localize;
        private readonly IEventManager _eventManager;
        public OrderService(IApplicationContext applicationContext, IOrderItemService orderItemService,
            IEnumerable<IPaymentService> paymentServices,
            ILocalize localize,
            IEventManager eventManager,
            CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _orderItemService = orderItemService;
            _paymentServices = paymentServices;
            _localize = localize;
            _eventManager = eventManager;
        }

        public override Order Get(params object[] primaryKey)
        {
            Order order = base.Get(primaryKey);
            order.OrderItems = _orderItemService.Get(m => m.OrderId == order.ID);
            return order;
        }

        public override ServiceResult<Order> Add(Order item)
        {
            item.ID = Guid.NewGuid().ToString("N");
            item.OrderStatus = (int)OrderStatus.UnPaid;
            ServiceResult<Order> result = base.Add(item);
            if (!result.HasViolation)
            {
                foreach (var orderItem in item.OrderItems)
                {
                    orderItem.OrderId = item.ID;
                    _orderItemService.Add(orderItem);
                }
            }
            _eventManager.Trigger(Events.OnPendingOrderCreated, item);
            return result;
        }

        public void BeginPay(Order order)
        {
            order.OrderStatus = (int)OrderStatus.UnPaid;
            order.PayTime = DateTime.Now;
            Update(order);
            _eventManager.Trigger(Events.OnPaymentBegin, order);
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
            ServiceResult<bool> result = new ServiceResult<bool>
            {
                Result = false
            };
            result.RuleViolations.Add(new RuleViolation("Error", _localize.Get("Only unpaid order can be closed!")));
            return result;
        }

        public void CompletePay(Order order, string paymentGateway, string paymentID)
        {
            order.OrderStatus = (int)OrderStatus.Paid;
            order.CompletePayTime = DateTime.Now;
            order.PaymentGateway = paymentGateway;
            order.PaymentID = paymentID;
            Update(order);
            _eventManager.Trigger(Events.OnPaymentCompleted, order);
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
            ServiceResult<bool> failed = new ServiceResult<bool>
            {
                Result = false
            };
            if (order.PaymentID.IsNullOrEmpty())
            {
                failed.RuleViolations.Add(new RuleViolation("Error", _localize.Get("Unpaid order")));
            }
            if (order.RefundID.IsNotNullAndWhiteSpace())
            {
                failed.RuleViolations.Add(new RuleViolation("Error", _localize.Get("Refunded")));
            }
            if (amount > order.Total)
            {
                failed.RuleViolations.Add(new RuleViolation("Error", _localize.Get("Refund amount exceeds the amount of the order")));
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
