/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Product.Models;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Easy.Extend;

namespace ZKEACMS.Product.Service
{
    public class ProductDetailWidgetService : WidgetService<ProductDetailWidget>
    {
        private readonly IProductService _productService;
        public ProductDetailWidgetService(IWidgetBasePartService widgetService, IProductService productService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _productService = productService;
        }
        
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            int productId = actionContext.RouteData.GetPost();
            ProductEntity product = null;
            if (productId != 0)
            {
                product = _productService.Get(productId);
                if (product !=null && product.Url.IsNotNullAndWhiteSpace() && actionContext.RouteData.GetProductUrl().IsNullOrWhiteSpace())
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{product.Url}.html", true);
                }
            }
            if (product == null && ApplicationContext.IsAuthenticated)
            {
                foreach (var item in _productService.Get().AsQueryable().OrderByDescending(m => m.ID).Take(1))
                {
                    product = _productService.Get(item.ID);
                }
            }
            if (product == null)
            {
                actionContext.NotFoundResult();
            }
            if (product != null)
            {
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    var page = layout.Page;
                    page.MetaDescription = product.SEODescription;
                    page.MetaKeyWorlds = product.SEOKeyWord;
                    page.Title = product.SEOTitle ?? product.Title;
                }
            }

            return widget.ToWidgetViewModelPart(product ?? new ProductEntity());
        }
    }
}