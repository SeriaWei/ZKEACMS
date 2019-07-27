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
using Easy.Extend;
using ZKEACMS.Page;

namespace ZKEACMS.Product.Service
{
    public class ProductListWidgetService : WidgetService<ProductListWidget>
    {
        private readonly IProductService _productService;
        private readonly IProductCategoryService _productCategoryService;
        private readonly IPageService _pageService;
        public ProductListWidgetService(IWidgetBasePartService widgetService,
            IProductService productService,
            IProductCategoryService productCategoryService,
            IApplicationContext applicationContext,
            IPageService pageService,
            CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _productService = productService;
            _productCategoryService = productCategoryService;
            _pageService = pageService;
        }

        private string GetDetailPageUrl()
        {
            var baseDetail = WidgetBasePartService.Get(m => m.ServiceTypeName == "ZKEACMS.Product.Service.ProductDetailWidgetService").FirstOrDefault();
            if (baseDetail != null)
            {
                var page = _pageService.Get(baseDetail.PageID);
                if (page != null)
                {
                    return page.Url;
                }
            }
            return "~/product-detail";
        }
        public override ServiceResult<ProductListWidget> Add(ProductListWidget item)
        {
            if (!item.PageSize.HasValue || item.PageSize.Value == 0)
            {
                item.PageSize = 12;
            }
            
            if (item.DetailPageUrl.IsNullOrWhiteSpace())
            {
                item.DetailPageUrl = GetDetailPageUrl();
            }
            return base.Add(item);
        }
        public override ProductListWidget Get(params object[] primaryKeys)
        {
            var widget = base.Get(primaryKeys);
            if (widget.DetailPageUrl.IsNullOrWhiteSpace())
            {
                widget.DetailPageUrl = GetDetailPageUrl();
                Update(widget);
            }
            return widget;
        }
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            ProductListWidget currentWidget = widget as ProductListWidget;
            IEnumerable<ProductEntity> products = null;
            int pageIndex = actionContext.RouteData.GetPage();
            int cate = actionContext.RouteData.GetCategory();
            var pagin = new Pagination
            {
                PageIndex = pageIndex,
                PageSize = currentWidget.PageSize ?? 20,
                OrderBy = "OrderIndex",
                ThenByDescending = "ID"
            };

            Expression<Func<ProductEntity, bool>> filter = null;
            if (cate != 0)
            {
                filter = m => m.IsPublish && m.ProductCategoryID == cate;
            }
            else
            {
                var ids = _productCategoryService.Get(m => m.ID == currentWidget.ProductCategoryID || m.ParentID == currentWidget.ProductCategoryID).Select(m => m.ID).ToList();
                filter = m => m.IsPublish && ids.Contains(m.ProductCategoryID);
            }
            if (currentWidget.IsPageable)
            {
                products = _productService.Get(filter, pagin);
            }
            else
            {
                products = _productService.Get().Where(filter).OrderBy(m => m.OrderIndex).ThenByDescending(m => m.ID).ToList();
            }

            var currentCategory = _productCategoryService.Get(cate == 0 ? currentWidget.ProductCategoryID : cate);
            if (currentCategory != null)
            {
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    var page = layout.Page;
                    //page.Title = (page.Title ?? "") + " - " + currentCategory.Title;
                    page.Title = page.Title.IsNullOrWhiteSpace() ? currentCategory.Title : $"{page.Title} - {currentCategory.Title}";
                }
            }

            return widget.ToWidgetViewModelPart(new ProductListWidgetViewModel
            {
                Products = products,
                Page = pagin,
                IsPageable = currentWidget.IsPageable,
                Columns = currentWidget.Columns,
                DetailPageUrl = currentWidget.DetailPageUrl
            });
        }
    }
}