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

namespace ZKEACMS.Shop
{
    public class ShopPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            return null;
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {

        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("shop").Include("~/Plugins/ZKEACMS.Shop/Content/shop.css", "~/Plugins/ZKEACMS.Shop/Content/shop.min.css");
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
            serviceCollection.AddDbContext<OrderDbContext>();
        }
    }
}