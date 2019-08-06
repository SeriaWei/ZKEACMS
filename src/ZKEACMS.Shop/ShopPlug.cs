/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 *
 */
using Easy.Mvc.Resource;
using Easy.Mvc.Route;
using System;
using System.Collections.Generic;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;
using Easy.RepositoryPattern;
using ZKEACMS.Shop.Service;
using Alipay.AopSdk.AspnetCore;
using Microsoft.Extensions.Configuration;
using Alipay.AopSdk.F2FPay.AspnetCore;
using ZKEACMS.Shop.Payment;
using ZKEACMS.Account;
using Easy;
using ZKEACMS.Shop.Models;
using ZKEACMS.WidgetTemplate;

namespace ZKEACMS.Shop
{
    public class ShopPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor
            {
                RouteName = "Basket",
                Template = "basket/{action}",
                Defaults = new { controller = "basket", action = "add" },
                Priority = 11
            };
            yield return new RouteDescriptor
            {
                RouteName = "AliPay",
                Template = "alipay/{action}/{orderId?}",
                Defaults = new { controller = "alipay", action = "pay" },
                Priority = 11
            };
            yield return new RouteDescriptor
            {
                RouteName = "CustomOrder",
                Template = "myorder/{action}/{Id?}",
                Defaults = new { controller = "customorder", action = "index" },
                Priority = 11
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "电子商务",
                Icon = "glyphicon-shopping-cart",
                Order = 9,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "订单",
                        Icon = "glyphicon-shopping-cart",
                        Url="~/admin/order",
                        Order = 1,
                        PermissionKey = PermissionKeys.ManageOrder
                    },
                    new AdminMenu
                    {
                        Title = "支付宝集成设置",
                        Icon = "glyphicon-credit-card",
                        Url="~/admin/alipaysetting/config",
                        Order = 1,
                        PermissionKey = PermissionKeys.PaymentConfigManage
                    }
                }
            };
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            script("basket")
                .Include("~/Plugins/ZKEACMS.Shop/Scripts/ZKEACMS.Basket.js", "~/Plugins/ZKEACMS.Shop/Scripts/ZKEACMS.Basket.min.js")
                .RequiredAtFoot();
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("shop").Include("~/Plugins/ZKEACMS.Shop/Content/shop.css", "~/Plugins/ZKEACMS.Shop/Content/shop.min.css")
                .RequiredAtHead();
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor { Module = "商城", Title = "查看订单", Key = PermissionKeys.ViewOrder };
            yield return new PermissionDescriptor { Module = "商城", Title = "管理订单", Key = PermissionKeys.ManageOrder };

            yield return new PermissionDescriptor { Module = "商城", Title = "查看支付平台支付信息", Key = PermissionKeys.ViewOrderPayment };
            yield return new PermissionDescriptor { Module = "商城", Title = "查看支付平台退款信息", Key = PermissionKeys.ViewOrderRefund };
            yield return new PermissionDescriptor { Module = "商城", Title = "退款", Key = PermissionKeys.RefundOrder };
            yield return new PermissionDescriptor { Module = "商城", Title = "支付集成设置", Key = PermissionKeys.PaymentConfigManage };
            //yield return new PermissionDescriptor { Module = "商城", Title = "关闭订单", Key = PermissionKeys.CloseOrder };
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();

            serviceCollection.TryAddTransient<IBasketService, BasketService>();
            serviceCollection.TryAddTransient<IOrderService, OrderService>();
            serviceCollection.TryAddTransient<IOrderItemService, OrderItemService>();
            serviceCollection.AddTransient<IUserCenterLinksProvider, ShopCenterLinksProvider>();
            serviceCollection.AddTransient<IPaymentService, AliPaymentService>();

            serviceCollection.ConfigureMetaData<Basket, BasketMetaData>();
            serviceCollection.ConfigureMetaData<Order, OrderMetaData>();
            serviceCollection.ConfigureMetaData<OrderItem, OrderItemMetaData>();

            serviceCollection.ConfigureMetaData<AlipayOptions, AlipayOptionsMetaData>();

            var configuration = new ConfigurationBuilder()
             .SetBasePath(CurrentPluginPath)
             .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true).Build();

            serviceCollection.Configure<AlipayOptions>(configuration.GetSection("Alipay"));


            serviceCollection.AddAlipay(options => { }).AddAlipayF2F();

            serviceCollection.Replace(new ServiceDescriptor(typeof(IAlipayService), typeof(Service.AlipayService), ServiceLifetime.Transient));
        }
    }
}