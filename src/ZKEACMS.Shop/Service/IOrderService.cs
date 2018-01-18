using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;

namespace ZKEACMS.Shop.Service
{
    public interface IOrderService : IService<Order>
    {
        void BeginPay(Order order);
        void CompletePay(Order order, string paymentGateway, string paymentID);

        PaymentInfo GetPaymentInfo(string orderId);
        void Refund(string orderId, decimal amount, string reason);
        RefundInfo GetRefund(string orderId);
        void CloseOrder(string orderId);
    }
}
