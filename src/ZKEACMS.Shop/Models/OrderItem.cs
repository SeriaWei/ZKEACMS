/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */
using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop.Models
{
    [ViewConfigure(typeof(OrderItemMetaData)), Table("OrderItem")]
    public class OrderItem : Basket
    {
        public string OrderId { get; set; }
    }
    class OrderItemMetaData : ViewMetaData<OrderItem>
    {
        protected override void ViewConfigure()
        {

        }
    }
}
