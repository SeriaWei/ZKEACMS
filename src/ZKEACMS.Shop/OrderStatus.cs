/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop
{

    public enum OrderStatus
    {
        /// <summary>
        /// 未支付
        /// </summary>
        UnPaid = 1,
        /// <summary>
        /// 取消
        /// </summary>
        Cancel = 2,
        /// <summary>
        /// 已支付
        /// </summary>
        Paid = 3,
        /// <summary>
        /// 已发货
        /// </summary>
        Shiped = 4,
        /// <summary>
        /// 交易完成
        /// </summary>
        Complete = 5,
        /// <summary>
        /// 已退款
        /// </summary>
        Refund = 6,
        /// <summary>
        /// 退款中
        /// </summary>
        Refunding = 7
    }
}
