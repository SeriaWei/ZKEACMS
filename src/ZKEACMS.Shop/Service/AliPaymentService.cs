using Alipay.AopSdk.AspnetCore;
using Alipay.AopSdk.Core.Domain;
using Alipay.AopSdk.Core.Request;
using Easy.RepositoryPattern;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Models;
using ZKEACMS.Shop.Payment;

namespace ZKEACMS.Shop.Service
{
    public class AliPaymentService : IPaymentService
    {
        class AliPaymentResponse
        {
            public string code { get; set; }
            public string msg { get; set; }
            public string sub_msg { get; set; }
            public string buyer_logon_id { get; set; }
            public decimal buyer_pay_amount { get; set; }
            public string buyer_user_id { get; set; }
            public string buyer_user_type { get; set; }
            public decimal invoice_amount { get; set; }
            public string out_trade_no { get; set; }
            public decimal point_amount { get; set; }
            public decimal receipt_amount { get; set; }
            public DateTime send_pay_date { get; set; }
            public decimal total_amount { get; set; }
            public string trade_no { get; set; }
            public string trade_status { get; set; }

            public string fund_change { get; set; }
            public string gmt_refund_pay { get; set; }
            public string open_id { get; set; }
            public decimal refund_fee { get; set; }
            public decimal send_back_fee { get; set; }

            public decimal refund_amount { get; set; }
        }
        private readonly IAlipayService _alipayService;
        public AliPaymentService(IAlipayService alipayService)
        {
            _alipayService = alipayService;
        }
        public string Getway => Gateways.AliPay;

        public ServiceResult<bool> CloseOrder(Order order)
        {
            AlipayTradeCloseModel model = new AlipayTradeCloseModel();
            model.OutTradeNo = order.ID;
            model.TradeNo = order.PaymentID;

            AlipayTradeCloseRequest request = new AlipayTradeCloseRequest();
            request.SetBizModel(model);

            var response = _alipayService.Execute(request);
            var responseEntry = JObject.Parse(response.Body).GetValue("alipay_trade_close_response").ToObject<AliPaymentResponse>();
            var status = responseEntry.msg.Equals("Success", StringComparison.OrdinalIgnoreCase);
            var result = new ServiceResult<bool>
            {
                Result = status
            };
            if (!status)
            {
                result.RuleViolations.Add(new RuleViolation("Error", responseEntry.msg + (responseEntry.sub_msg ?? "")));
            }
            return result;
        }

        public PaymentInfo GetPaymentInfo(Order order)
        {
            AlipayTradeQueryModel model = new AlipayTradeQueryModel
            {
                OutTradeNo = order.ID,
                TradeNo = order.PaymentID
            };

            AlipayTradeQueryRequest request = new AlipayTradeQueryRequest();
            request.SetBizModel(model);

            var response = _alipayService.Execute(request);
            var info = JObject.Parse(response.Body).GetValue("alipay_trade_query_response").ToObject<AliPaymentResponse>();
            //response.Body;
            return new PaymentInfo
            {
                Account = info.buyer_logon_id,
                PayDate = info.send_pay_date,
                TotalAmount = info.total_amount,
                TradeStatus = info.msg,
                Body = response.Body
            };
        }

        public RefundInfo GetRefund(Order order)
        {
            AlipayTradeFastpayRefundQueryModel model = new AlipayTradeFastpayRefundQueryModel();
            model.OutTradeNo = order.ID;
            model.TradeNo = order.PaymentID;
            model.OutRequestNo = order.RefundID;

            AlipayTradeFastpayRefundQueryRequest request = new AlipayTradeFastpayRefundQueryRequest();
            request.SetBizModel(model);

            var response = _alipayService.Execute(request);
            var responseEntry = JObject.Parse(response.Body).GetValue("alipay_trade_fastpay_refund_query_response").ToObject<AliPaymentResponse>();
            return new RefundInfo
            {
                RefundAmount = responseEntry.refund_amount,
                TotalAmount = responseEntry.total_amount
            };
        }

        public ServiceResult<bool> Refund(Order order)
        {
            AlipayTradeRefundModel model = new AlipayTradeRefundModel();
            model.OutTradeNo = order.ID;
            model.TradeNo = order.PaymentID;
            model.RefundAmount = order.Refund.ToString();
            model.RefundReason = order.RefundReason;
            model.OutRequestNo = "Refund-" + order.ID;
            order.RefundID = model.OutRequestNo;
            AlipayTradeRefundRequest request = new AlipayTradeRefundRequest();
            request.SetBizModel(model);

            var response = _alipayService.Execute(request);
            var responseEntry = JObject.Parse(response.Body).GetValue("alipay_trade_refund_response").ToObject<AliPaymentResponse>();
            var status = responseEntry.msg.Equals("Success", StringComparison.OrdinalIgnoreCase);
            var result = new ServiceResult<bool>
            {
                Result = status
            };
            if (!status)
            {
                result.RuleViolations.Add(new RuleViolation("Error", responseEntry.msg + (responseEntry.sub_msg ?? "")));
            }
            return result;
        }
    }
}
