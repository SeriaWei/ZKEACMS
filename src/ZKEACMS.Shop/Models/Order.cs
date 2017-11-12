using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop.Models
{
    [Table("Order")]
    public class Order : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public string UserId { get; set; }
        public decimal Total { get; set; }
        public int OrderStatus { get; set; }
        public DateTime? PayTime { get; set; }
        public DateTime? CompletePayTime { get; set; }
        public string TrackingNumber { get; set; }
        public int LogisticsCompany { get; set; }
    }
}
