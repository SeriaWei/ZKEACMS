/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using Easy.Mvc.Resource;
using Microsoft.Extensions.DependencyInjection;
using Easy.Mvc.Route;
using ZKEACMS.Common.Models;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;
using Easy;
using ZKEACMS.WidgetTemplate;
using Easy.RepositoryPattern;
using ZKEACMS.Route;
using System.Collections.Concurrent;

namespace ZKEACMS.Product
{
    public class ProductPlug : PluginBase
    {
        public override IEnumerable<RouteDescriptor> RegistRoute()
        {
            return null;
        }

        public override IEnumerable<AdminMenu> AdminMenu()
        {
            yield return new AdminMenu
            {
                Title = "产品管理",
                Icon = "glyphicon-list-alt",
                Order = 11,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "产品列表",
                        Url = "~/admin/Product",
                        Icon = "glyphicon-align-justify",
                        PermissionKey = PermissionKeys.ViewProduct
                    },
                    new AdminMenu
                    {
                        Title = "产品排序",
                        Url = "~/admin/Product/Sort",
                        Icon = "glyphicon-sort",
                        PermissionKey = PermissionKeys.ViewProduct
                    },
                    new AdminMenu
                    {
                        Title = "产品类别",
                        Url = "~/admin/ProductCategory",
                        Icon = "glyphicon-th-list",
                        PermissionKey = PermissionKeys.ViewProductCategory
                    },
                    new AdminMenu
                    {
                        Title = "产品标签",
                        Url = "~/admin/ProductCategoryTag",
                        Icon = "glyphicon-tag",
                        PermissionKey = PermissionKeys.ViewProductCategoryTag
                    }
                }
            };
        }

        protected override void InitScript(Func<string, ResourceHelper> script)
        {
            script("PhotoWall")
                .Include("~/Plugins/ZKEACMS.Product/Scripts/jquery-photowall/jquery-photowall.js");

            script("product-ecommerce")
                .Include("~/Plugins/ZKEACMS.Product/Scripts/product-ecommerce.js", "~/Plugins/ZKEACMS.Product/Scripts/product-ecommerce.min.js");
        }

        protected override void InitStyle(Func<string, ResourceHelper> style)
        {
            style("PhotoWall")
                .Include("~/Plugins/ZKEACMS.Product/Scripts/jquery-photowall/jquery-photowall.css");

            style("product-ecommerce")
                .Include("~/Plugins/ZKEACMS.Product/Content/product-ecommerce.css", "~/Plugins/ZKEACMS.Product/Content/product-ecommerce.min.css");
        }

        public override IEnumerable<PermissionDescriptor> RegistPermission()
        {
            yield return new PermissionDescriptor(PermissionKeys.ViewProduct, "产品", "查看产品", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageProduct, "产品", "管理产品", "");
            yield return new PermissionDescriptor(PermissionKeys.PublishProduct, "产品", "发布产品", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewProductCategory, "产品", "查看产品类别", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageProductCategory, "产品", "管理产品类别", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewProductCategoryTag, "产品", "查看产品标签", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageProductCategoryTag, "产品", "管理产品标签", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            string groupName = "3.产品";
            yield return new WidgetTemplateEntity<ProductListWidgetService>
            {
                Title = "产品列表",
                GroupName = groupName,
                PartialView = "Widget.ProductList",
                Thumbnail = "~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png",
                Order = 1
            };
            yield return new WidgetTemplateEntity<ProductDetailWidgetService>
            {
                Title = "产品内容",
                GroupName = groupName,
                PartialView = "Widget.ProductDetail",
                Thumbnail = "~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png",
                Order = 2
            };
            yield return new WidgetTemplateEntity<ProductCategoryWidgetService>
            {
                Title = "产品类别",
                GroupName = groupName,
                PartialView = "Widget.ProductCategory",
                Thumbnail = "~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png",
                Order = 3
            };
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();
            
            serviceCollection.AddTransient<IRouteDataProvider, ProductRouteDataProvider>();
            serviceCollection.AddTransient<IRouteDataProvider, ProductCategoryRouteDataProvider>();

            serviceCollection.AddTransient<IProductService, ProductService>();
            serviceCollection.AddTransient<IProductCategoryService, ProductCategoryService>();
            serviceCollection.AddTransient<IProductCategoryTagService, ProductCategoryTagService>();
            serviceCollection.AddTransient<IProductTagService, ProductTagService>();
            serviceCollection.AddTransient<IProductImageService, ProductImageService>();

            serviceCollection.Configure<ProductListWidget>(option =>
            {
                option.DataSourceLinkTitle = "产品列表";
                option.DataSourceLink = "~/admin/Product";
            });
            serviceCollection.Configure<ProductCategoryWidget>(option =>
            {
                option.DataSourceLinkTitle = "产品类别";
                option.DataSourceLink = "~/admin/ProductCategory";
            });

            serviceCollection.ConfigureMetaData<ProductCategoryWidget, ProductCategoryWidgetMedata>();
            serviceCollection.ConfigureMetaData<ProductDetailWidget, ProductDetailWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ProductListWidget, ProductListWidgetMetaData>();
        }
        
    }
}