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

namespace ZKEACMS.Shop.Controllers
{
    public class BasketController : BasicController<Basket, int, IBasketService>
    {
        public BasketController(IBasketService service) : base(service)
        {
        }
        public IActionResult MyItems()
        {
            return View();
        }
    }
}
