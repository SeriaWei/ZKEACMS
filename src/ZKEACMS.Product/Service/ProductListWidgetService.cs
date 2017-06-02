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
using System.Linq.Expressions;

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
            int pageIndex = actionContext.RouteData.GetPage();
            int cate = actionContext.RouteData.GetCategory();
            var page = new Pagination { PageIndex = pageIndex, PageSize = pwidget.PageSize ?? 20 };
            Expression<Func<ProductEntity, bool>> filter = null;
            if (cate != 0)
            {
                filter = m => m.IsPublish && m.ProductCategoryID == cate;
            }
            else
            {
                var ids = _productCategoryService.Get(m => m.ID == pwidget.ProductCategoryID || m.ParentID == pwidget.ProductCategoryID).Select(m => m.ID);
                filter = m => m.IsPublish && ids.Any(id => id == m.ProductCategoryID);
            }
            if (pwidget.IsPageable)
            {
                page.RecordCount = _productService.Count(filter);
                products = _productService.Get(filter).OrderBy(m => m.OrderIndex).ThenByDescending(m => m.ID).Skip(page.PageIndex * page.PageSize).Take(page.PageSize);
            }
            else
            {
                products = _productService.Get(filter).OrderBy(m => m.OrderIndex).ThenByDescending(m => m.ID);
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