/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Controllers;
using ZKEACMS.Shop.Models;
using ZKEACMS.Shop.Service;
using Easy.Mvc.Extend;
using Easy.Mvc.Authorize;
using Easy.Mvc;
using ZKEACMS.Shop.ViewModel;
using ZKEACMS.Shop.Filter;

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
        public IActionResult Add(int productId, int? quantity)
        {
            var basket = new Basket { ProductId = productId, Quantity = quantity ?? 1 };
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
        public IActionResult Index()
        {
            return View(new BasketData(_basketService.Get()));
        }
    }
}
