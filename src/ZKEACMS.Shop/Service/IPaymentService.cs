using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;

namespace ZKEACMS.Shop.Service
{
    public interface IPaymentService
    {
        string Getway { get; }
        PaymentInfo GetPaymentInfo(Order order);
        ServiceResult<bool> Refund(Order order);
        RefundInfo GetRefund(Order order);
        ServiceResult<bool> CloseOrder(Order order);
    }
}
