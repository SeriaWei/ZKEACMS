using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop.Models
{
    public class PaymentInfo
    {
        public string Account { get; set; }
        public string TradeStatus { get; set; }
        public decimal TotalAmount { get; set; }
        public DateTime PayDate { get; set; }

        public string Body { get; set; }
    }
}
