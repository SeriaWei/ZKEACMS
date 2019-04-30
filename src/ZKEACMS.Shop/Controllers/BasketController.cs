/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */
using Easy.Mvc;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using ZKEACMS.Shop.Filter;
using ZKEACMS.Shop.Models;
using ZKEACMS.Shop.Service;
using ZKEACMS.Shop.ViewModel;
using Easy.Extend;

namespace ZKEACMS.Shop.Controllers
{
    [CustomLoginCheck]
    public class BasketController : Controller
    {
        private CMSApplicationContext applicationContext;
        private readonly IBasketService _basketService;
        public BasketController(IBasketService basketService, IApplicationContextAccessor applicationContextAccessor)
        {
            _basketService = basketService;
            applicationContext = applicationContextAccessor.Current;

        }
        [HttpPost]
        public IActionResult Index()
        {
            return View(new BasketData(_basketService.Get()));
        }
        [HttpPost]
        public IActionResult Add(int productId, int? quantity, string tags)
        {
            var basket = new Basket { ProductId = productId, Quantity = quantity ?? 1, Description = tags };
            _basketService.Add(basket);
            return Json(new AjaxResult { Status = AjaxStatus.Normal, Data = new BasketData(_basketService.Get()) });
        }
        [HttpPost]
        public IActionResult Update(int basketId, int quantity)
        {
            var basket = _basketService.Get(basketId);
            if (basket != null)
            {
                basket.Quantity = quantity;
                _basketService.Update(basket);
            }
            return Json(new AjaxResult { Status = AjaxStatus.Normal, Data = new BasketData(_basketService.Get()) });
        }
        [HttpPost]
        public IActionResult Remove(int basketId)
        {
            _basketService.Remove(basketId);
            return Json(new AjaxResult { Status = AjaxStatus.Normal, Data = new BasketData(_basketService.Get()) });
        }
        [HttpPost]
        public IActionResult GetBaskets()
        {
            return Json(new AjaxResult { Status = AjaxStatus.Normal, Data = new BasketData(_basketService.Get()) });
        }
        [HttpPost]
        public IActionResult CheckOut()
        {
            var basket = _basketService.Get();
            if (basket.Any())
            {
                return View(new BasketData(basket));
            }
            return View("Index", new BasketData(basket));
        }
        [HttpPost]
        public IActionResult ConfirmOrder(Order order)
        {
            order = _basketService.CheckOut(order);
            if (order.ID.IsNotNullAndWhiteSpace())
            {
                return RedirectToAction("Pay", "AliPay", new { orderId = order.ID });
            }
            return Redirect("~/");
        }
    }
}
