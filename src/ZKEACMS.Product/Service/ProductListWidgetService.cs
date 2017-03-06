/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.ViewModel;
using ZKEACMS.Widget;
using System.Linq;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Product.Service
{
    public class ProductListWidgetService : WidgetService<ProductListWidget, ProductDbContext>
    {
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        public ProductListWidgetService(IWidgetBasePartService widgetService, IProductService productService, IProductCategoryService productCategoryService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _productService = productService;
            _productCategoryService = productCategoryService;
        }

        public override DbSet<ProductListWidget> CurrentDbSet
        {
            get
            {
                return DbContext.ProductListWidget;
            }
        }

        public override void Add(ProductListWidget item)
        {
            if (!item.PageSize.HasValue || item.PageSize.Value == 0)
            {
                item.PageSize = 20;
            }
            base.Add(item);
        }
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            ProductListWidget pwidget = widget as ProductListWidget;
            IEnumerable<ProductEntity> products = null;
            int p = actionContext.RouteData.GetPage();
            var page = new Pagination { PageIndex = p, PageSize = pwidget.PageSize ?? 20 };
            if (pwidget.IsPageable)
            {
                products = _productService.Get(m => m.IsPublish == true, page);
            }
            else
            {
                products = _productService.Get(m => m.IsPublish == true);
            }


            int c = actionContext.RouteData.GetCategory();
            if (c != 0)
            {
                products = products.Where(m => m.ProductCategoryID == c);
            }
            else
            {
                var ids = _productCategoryService.Get(m => m.ParentID == pwidget.ProductCategoryID).Select(m => m.ID);
                if (ids.Any())
                {
                    products = products.Where(m => ids.Any(id => id == m.ProductCategoryID));
                }
                else
                {
                    products = products.Where(m => m.ProductCategoryID == pwidget.ProductCategoryID);
                }
            }

            return widget.ToWidgetViewModelPart(new ProductListWidgetViewModel
            {
                Products = products,
                Page = page,
                IsPageable = pwidget.IsPageable,
                Columns = pwidget.Columns,
                DetailPageUrl = pwidget.DetailPageUrl
            });
        }
    }
}