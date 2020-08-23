/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.Shop.Models
{
    [DataTable("Order")]
    public class Order : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public string UserId { get; set; }
        public string Contact { get; set; }
        public string PhoneNumber { get; set; }
        [Column(TypeName = "decimal(18,4)")]
        public decimal Total { get; set; }
        public int OrderStatus { get; set; }
        public DateTime? PayTime { get; set; }
        public DateTime? CompletePayTime { get; set; }
        public string TrackingNumber { get; set; }
        public string LogisticsCompany { get; set; }
        public string ShippingAddress { get; set; }
        public string PaymentGateway { get; set; }
        public string PaymentID { get; set; }
        public string RefundID { get; set; }
        [Column(TypeName = "decimal(18,4)")]
        public decimal? Refund { get; set; }
        public string RefundReason { get; set; }
        public DateTime? RefundDate { get; set; }
        public string OrderStatusText()
        {
            switch ((Shop.OrderStatus)OrderStatus)
            {
                case Shop.OrderStatus.Cancel: return "Cancel";
                case Shop.OrderStatus.Complete: return "Complete";
                case Shop.OrderStatus.Paid: return "Paid";
                case Shop.OrderStatus.Refund: return "Refund";
                case Shop.OrderStatus.Shiped: return "Shiped";
                case Shop.OrderStatus.UnPaid: return "UnPaid";
                case Shop.OrderStatus.Refunding: return "Refunding";
            }
            return "Complete";
        }

        [NotMapped]
        public IEnumerable<OrderItem> OrderItems { get; set; }
    }
    class OrderMetaData : ViewMetaData<Order>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.UserId).AsHidden();
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.CreatebyName).AsHidden();
            ViewConfig(m => m.ID).AsTextBox().ReadOnly().ShowInGrid();
            ViewConfig(m => m.OrderStatus).AsDropDownList().DataSource(Easy.Constant.SourceType.Dictionary).ShowInGrid().Required().ReadOnly();
            ViewConfig(m => m.Contact).AsTextBox().ShowInGrid();
            ViewConfig(m => m.PhoneNumber).AsTextBox().ShowInGrid();
            ViewConfig(m => m.ShippingAddress).AsTextBox().ShowInGrid();
            ViewConfig(m => m.PaymentGateway).AsTextBox().ReadOnly();
            ViewConfig(m => m.PaymentID).AsTextBox().ReadOnly();
            ViewConfig(m => m.PayTime).AsTextBox().ReadOnly().FormatAsDateTime();
            ViewConfig(m => m.CompletePayTime).AsTextBox().ReadOnly().FormatAsDateTime();
            ViewConfig(m => m.Total).AsTextBox().ShowInGrid().RegularExpression(Easy.Constant.RegularExpression.Float);

            ViewConfig(m => m.RefundID).AsTextBox().ReadOnly();
            ViewConfig(m => m.Refund).AsTextBox().RegularExpression(Easy.Constant.RegularExpression.Float);
            ViewConfig(m => m.RefundReason).AsTextBox();
            ViewConfig(m => m.RefundDate).AsTextBox().ReadOnly();
            ViewConfig(m => m.OrderItems).AsHidden().Ignore();
        }
    }
}
