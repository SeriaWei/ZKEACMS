/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

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
                Title = "Manage Product",
                Icon = "glyphicon-list-alt",
                Order = 11,
                Children = new List<AdminMenu>
                {
                    new AdminMenu
                    {
                        Title = "Product List",
                        Url = "~/admin/product",
                        Icon = "glyphicon-align-justify",
                        PermissionKey = PermissionKeys.ViewProduct
                    },
                    new AdminMenu
                    {
                        Title = "Product Gallery",
                        Url = "~/admin/productgallery",
                        Icon = "glyphicon-th",
                        PermissionKey = PermissionKeys.ViewProduct
                    },
                    new AdminMenu
                    {
                        Title = "Product Sort",
                        Url = "~/admin/product/sort",
                        Icon = "glyphicon-sort",
                        PermissionKey = PermissionKeys.ViewProduct
                    },
                    new AdminMenu
                    {
                        Title = "Product Category",
                        Url = "~/admin/productcategory",
                        Icon = "glyphicon-th-list",
                        PermissionKey = PermissionKeys.ViewProductCategory
                    },
                    new AdminMenu
                    {
                        Title = "Product Tag",
                        Url = "~/admin/productcategorytag",
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
            yield return new PermissionDescriptor(PermissionKeys.ViewProduct, "Product", "View Product", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageProduct, "Product", "Manage Product", "");
            yield return new PermissionDescriptor(PermissionKeys.PublishProduct, "Product", "Publish Product", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewProductCategory, "Product", "View Product Category", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageProductCategory, "Product", "Manage Product Category", "");
            yield return new PermissionDescriptor(PermissionKeys.ViewProductCategoryTag, "Product", "View Product Tag", "");
            yield return new PermissionDescriptor(PermissionKeys.ManageProductCategoryTag, "Product", "Manage Product Tag", "");
        }

        public override IEnumerable<WidgetTemplateEntity> WidgetServiceTypes()
        {
            string groupName = "3.Product";
            yield return new WidgetTemplateEntity<ProductListWidgetService>
            {
                Title = "Product List",
                GroupName = groupName,
                PartialView = "Widget.ProductList",
                Thumbnail = "~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductList.png",
                Order = 1
            };
            yield return new WidgetTemplateEntity<ProductDetailWidgetService>
            {
                Title = "Product Content",
                GroupName = groupName,
                PartialView = "Widget.ProductDetail",
                Thumbnail = "~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductDetail.png",
                Order = 2
            };
            yield return new WidgetTemplateEntity<ProductCategoryWidgetService>
            {
                Title = "Product Category",
                GroupName = groupName,
                PartialView = "Widget.ProductCategory",
                Thumbnail = "~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductCategory.png",
                Order = 3
            };
            yield return new WidgetTemplateEntity<ProductGalleryWidgetService>
            {
                Title = "Product Gallery",
                GroupName = groupName,
                PartialView = "Widget.ProductGallery",
                Thumbnail = "~/Plugins/ZKEACMS.Product/Content/Image/Widget.ProductGallery.png",
                Order = 4
            };
        }

        public override void ConfigureServices(IServiceCollection serviceCollection)
        {
            serviceCollection.AddSingleton<IOnModelCreating, EntityFrameWorkModelCreating>();

            serviceCollection.AddTransient<IRouteDataProvider, ProductRouteDataProvider>();
            serviceCollection.AddTransient<IRouteDataProvider, ProductCategoryRouteDataProvider>();

            serviceCollection.AddTransient<IProductService, ProductService>();
            serviceCollection.AddTransient<IProductGalleryService, ProductGalleryService>();
            serviceCollection.AddTransient<IProductApiService, ProductApiService>();
            serviceCollection.AddTransient<IProductCategoryService, ProductCategoryService>();
            serviceCollection.AddTransient<IProductCategoryApiService, ProductCategoryApiService>();
            serviceCollection.AddTransient<IProductCategoryTagService, ProductCategoryTagService>();
            serviceCollection.AddTransient<IProductTagService, ProductTagService>();
            serviceCollection.AddTransient<IProductImageService, ProductImageService>();
            serviceCollection.AddTransient<IProductUrlService, ProductUrlService>();
            serviceCollection.AddTransient<IProductListWidgetService, ProductListWidgetService>();

            serviceCollection.Configure<ProductListWidget>(option =>
            {
                option.DataSourceLinkTitle = "Product List";
                option.DataSourceLink = "~/admin/product";
            });
            serviceCollection.Configure<ProductCategoryWidget>(option =>
            {
                option.DataSourceLinkTitle = "Product Category";
                option.DataSourceLink = "~/admin/productcategory";
            });

            serviceCollection.ConfigureMetaData<ProductCategoryWidget, ProductCategoryWidgetMedata>();
            serviceCollection.ConfigureMetaData<ProductDetailWidget, ProductDetailWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ProductListWidget, ProductListWidgetMetaData>();
            serviceCollection.ConfigureMetaData<ProductGalleryWidget, ProductGalleryWidgetMetaData>();
        }

    }
}