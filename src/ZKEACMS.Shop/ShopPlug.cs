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

namespace ZKEACMS.Shop
{
    public class ShopPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            yield return new RouteDescriptor
            {
                RouteName = "Basket",
                Template = "Basket/{action}",
                Defaults = new { controller = "Basket", action = "Add" },
                Priority = 11
            };
            yield return new RouteDescriptor
            {
                RouteName = "AliPay",
                Template = "AliPay/{action}",
                Defaults = new { controller = "AliPay", action = "Pay" },
                Priority = 11
            };
            yield return new RouteDescriptor
            {
                RouteName = "CustomOrder",
                Template = "MyOrder/{action}/{Id?}",
                Defaults = new { controller = "CustomOrder", action = "Index" },
                Priority = 11
            };
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
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
        }

        public override IEnumerable<Type> WidgetServiceTypes()
        {
            return null;
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.TryAddTransient<IBasketService, BasketService>();
            serviceCollection.TryAddTransient<IOrderService, OrderService>();
            serviceCollection.TryAddTransient<IOrderItemService, OrderItemService>();
            serviceCollection.AddTransient<IUserCenterLinksProvider, ShopCenterLinksProvider>();
            serviceCollection.AddDbContext<OrderDbContext>();

            var configuration = new ConfigurationBuilder()
             .SetBasePath(CurrentPluginPath)
             .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true).Build();

            serviceCollection.Configure<AliPayConfig>(configuration.GetSection("Alipay"));

            serviceCollection.AddAlipay(options =>
            {
                options.AlipayPublicKey = configuration["Alipay:AlipayPublicKey"];
                options.AppId = configuration["Alipay:AppId"];
                options.CharSet = configuration["Alipay:CharSet"];
                options.Gatewayurl = configuration["Alipay:Gatewayurl"];
                options.PrivateKey = configuration["Alipay:PrivateKey"];
                options.SignType = configuration["Alipay:SignType"];
                options.Uid = configuration["Alipay:Uid"];
            }).AddAlipayF2F();
        }
    }
}