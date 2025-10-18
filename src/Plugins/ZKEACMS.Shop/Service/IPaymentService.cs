/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
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
        ErrorOr<bool> Refund(Order order);
        RefundInfo GetRefund(Order order);
        ErrorOr<bool> CloseOrder(Order order);
    }
}
