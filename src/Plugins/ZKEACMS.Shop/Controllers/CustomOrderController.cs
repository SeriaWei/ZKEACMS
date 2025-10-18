/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Authorize;
using ZKEACMS.Shop.Service;
using ZKEACMS.Shop.ViewModel;

namespace ZKEACMS.Shop.Controllers
{
    [CustomerAuthorize]
    public class CustomOrderController : Controller
    {
        private readonly IOrderService _orderService;
        private readonly IApplicationContextAccessor _applicationContextAccessor;
        public CustomOrderController(IOrderService orderService, IApplicationContextAccessor applicationContextAccessor)
        {
            _orderService = orderService;
            _applicationContextAccessor = applicationContextAccessor;
        }

        public IActionResult Index(int Id)
        {
            OrderListViewModel viewModel = new OrderListViewModel();
            Pagin pagin = new Pagin { PageIndex = Id, OrderByDescending = "CreateDate" };
            viewModel.Orders = _orderService.Get(m => m.UserId == _applicationContextAccessor.Current.CurrentCustomer.UserID, pagin);
            viewModel.Pagin = pagin;
            viewModel.Pagin.BaseUrlFormat = "~/MyOrder/Index/{0}";
            return View(viewModel);
        }

        public IActionResult Detail(string Id)
        {
            var order = _orderService.Get(Id);
            if (order.UserId != _applicationContextAccessor.Current.CurrentCustomer.UserID)
            {
                return RedirectToAction("Index");
            }
            return View(new OrderDetailViewModel
            {
                Order = order,
                OrderItems = order.OrderItems.ToList()
            });
        }
        public IActionResult Failed()
        {
            return View();
        }
        public IActionResult Remove(string Id)
        {
            var order = _orderService.Get(Id);
            if (order != null && order.UserId == _applicationContextAccessor.Current.CurrentCustomer.UserID)
            {
                _orderService.Remove(order);
            }
            return RedirectToAction("Index");
        }
    }
}
