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

namespace ZKEACMS.Shop.Controllers
{
    public class AliPayController : Controller
    {
        private readonly IAlipayService _alipayService;
        private readonly IOrderService _orderService;
        private readonly IOrderItemService _orderItemService;
        private readonly IOptions<AliPayConfig> _aliPayConfig;
        public AliPayController(IAlipayService alipayService, IOrderService orderService, IOrderItemService orderItemService, IOptions<AliPayConfig> aliPayConfig)
        {
            _alipayService = alipayService;
            _orderService = orderService;
            _orderItemService = orderItemService;
            _aliPayConfig = aliPayConfig;
        }

        public IActionResult Pay(string orderId)
        {
            var order = _orderService.Get(orderId);
            var items = _orderItemService.Get(m => m.OrderId == orderId);
            AlipayTradePagePayModel model = new AlipayTradePagePayModel
            {
                Body = string.Join(",", items.Select(m => m.Title)),
                Subject = items.First().Title,
                TotalAmount = order.Total.ToString(),
                OutTradeNo = orderId,
                ProductCode = "FAST_INSTANT_TRADE_PAY"
            };
            AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
            // 设置同步回调地址
            request.SetReturnUrl("http://localhost:5000/Pay/Callback");
            // 设置异步通知接收地址
            request.SetNotifyUrl("http://localhost:5000/Pay/Callback");
            request.SetBizModel(model);
            var response = _alipayService.SdkExecute(request);


            order.OrderStatus = (int)OrderStatus.UnPaid;
            order.PayTime = DateTime.Now;
            _orderService.Update(order);

            return Redirect(_aliPayConfig.Value.Gatewayurl + "?" + response.Body);
        }
        [HttpGet]
        public IActionResult Callback()
        {
            Dictionary<string, string> sArray = RequestGet();
            if (sArray.Count != 0)
            {
                if (ProcessOrder(sArray))
                {

                }
            }
            return View();
        }

        [HttpPost]
        public IActionResult Notify()
        {
            Dictionary<string, string> sArray = RequestPost();
            if (sArray.Count != 0)
            {
                if (ProcessOrder(sArray))
                {
                    return Content("success");
                }
            }
            return Content("fail");
        }

        private bool ProcessOrder(Dictionary<string, string> sArray)
        {
            bool flag = _alipayService.RSACheckV1(sArray);
            if (flag)
            {
                string orderId = sArray["out_trade_no"];
                var order = _orderService.Get(orderId);
                if (order != null && order.OrderStatus == (int)OrderStatus.UnPaid && order.Total.ToString() == sArray["total_amount"] && _aliPayConfig.Value.AppId == sArray["app_id"])
                {
                    order.OrderStatus = (int)OrderStatus.Paid;
                    order.CompletePayTime = DateTime.Now;
                    _orderService.Update(order);
                    return true;
                }
                else if (order != null && order.OrderStatus == (int)OrderStatus.Paid)
                {
                    return true;
                }
            }
            return flag;
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
