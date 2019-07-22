using Alipay.AopSdk.AspnetCore;
using Alipay.AopSdk.Core.Domain;
using Alipay.AopSdk.Core.Request;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Shop.Payment;
using ZKEACMS.Shop.Service;
using Easy.Mvc.Extend;
using ZKEACMS.Setting;
using Easy.Extend;
using Newtonsoft.Json;
using Easy.Mvc.Authorize;
using ZKEACMS.DataArchived;

namespace ZKEACMS.Shop.Controllers
{
    public class AliPayController : Controller
    {
        private readonly IAlipayService _alipayService;
        private readonly IOrderService _orderService;
        private readonly IOrderItemService _orderItemService;
        public AliPayController(IAlipayService alipayService,
            IOrderService orderService,
            IOrderItemService orderItemService )
        {
            _alipayService = alipayService;
            _orderService = orderService;
            _orderItemService = orderItemService;
        }

        public IActionResult Pay(string orderId)
        {
            var order = _orderService.Get(orderId);
            var items = _orderItemService.Get(m => m.OrderId == orderId);
            if (!items.Any())
            {
                return Redirect("~/");
            }
            AlipayTradePagePayModel model = new AlipayTradePagePayModel
            {
                Body = string.Join(",", items.Select(m => m.Title)),
                Subject = items.First().Title,
                TotalAmount = order.Total.ToString("F2"),
                OutTradeNo = orderId,
                ProductCode = "FAST_INSTANT_TRADE_PAY"
            };
            AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
            // 设置同步回调地址
            request.SetReturnUrl($"{HttpContext.Request.GetHostWithScheme()}/AliPay/Callback");

            // 设置异步通知接收地址
            request.SetNotifyUrl($"{HttpContext.Request.GetHostWithScheme()}/AliPay/Notify");
            request.SetBizModel(model);
            var response = _alipayService.SdkExecute(request);

            _orderService.BeginPay(order);

            return Redirect(_alipayService.Options.Gatewayurl + "?" + response.Body);
        }
        [HttpGet]
        public IActionResult Callback()
        {
            Dictionary<string, string> sArray = RequestGet();
            if (sArray.Count != 0)
            {
                string orderId;
                if (ProcessOrder(sArray, out orderId))
                {
                    return RedirectToAction("Detail", "CustomOrder", new { Id = orderId });
                }
            }
            return RedirectToAction("Failed", "CustomOrder");
        }

        [HttpPost]
        public IActionResult Notify()
        {
            Dictionary<string, string> sArray = RequestPost();
            if (sArray.Count != 0)
            {
                string orderId;
                if (ProcessOrder(sArray, out orderId))
                {
                    return Content("success");
                }
            }
            return Content("fail");
        }

        private bool ProcessOrder(Dictionary<string, string> sArray, out string orderId)
        {
            bool flag = _alipayService.RSACheckV1(sArray);
            if (flag)
            {
                orderId = sArray["out_trade_no"];
                var order = _orderService.Get(orderId);
                if (order != null && order.OrderStatus == (int)OrderStatus.UnPaid && order.Total == Decimal.Parse(sArray["total_amount"]) && _alipayService.Options.AppId == sArray["app_id"])
                {
                    _orderService.CompletePay(order, Gateways.AliPay, sArray["trade_no"]);
                    return true;
                }
                else if (order != null && order.OrderStatus == (int)OrderStatus.Paid)
                {
                    return true;
                }
            }
            orderId = string.Empty;
            return false;
        }

        #region 解析请求参数

        private Dictionary<string, string> RequestGet()
        {
            Dictionary<string, string> sArray = new Dictionary<string, string>();

            ICollection<string> requestItem = Request.Query.Keys;
            foreach (var item in requestItem)
            {
                sArray.Add(item, Request.Query[item]);

            }
            return sArray;

        }

        private Dictionary<string, string> RequestPost()
        {
            Dictionary<string, string> sArray = new Dictionary<string, string>();

            ICollection<string> requestItem = Request.Form.Keys;
            foreach (var item in requestItem)
            {
                sArray.Add(item, Request.Form[item]);

            }
            return sArray;

        }

        #endregion        
    }
}
