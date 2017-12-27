/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Product.Models;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace ZKEACMS.Product.Service
{
    public class ProductDetailWidgetService : WidgetService<ProductDetailWidget>
    {
        private readonly IProductService _productService;
        public ProductDetailWidgetService(IWidgetBasePartService widgetService, IProductService productService, IApplicationContext applicationContext, ProductDbContext dbContext)
            : base(widgetService, applicationContext,dbContext)
        {
            _productService = productService;
        }

        public override DbSet<ProductDetailWidget> CurrentDbSet
        {
            get
            {
                return (DbContext as ProductDbContext).ProductDetailWidget;
            }
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            int productId = actionContext.RouteData.GetPost();
            ProductEntity product = null;
            if (productId != 0)
            {
                product = _productService.Get(productId);
            }
            if (product == null)
            {
                foreach (var item in _productService.Get().AsQueryable().OrderByDescending(m => m.ID).Take(1))
                {
                    product = item;
                }
            }
            if (product == null)
            {
                product = new ProductEntity
                {
                    Title = "产品明细组件使用说明",
                    ImageUrl = "~/Plugins/ZKEACMS.Product/Content/Image/Example.png",
                    ProductContent = "<p>如上图所示，该组件需要一个<code>产品列表组件</code>组合使用，您需要在其它页面添加一个产品列表组件并链接过来，然后点击产品列表中的产品，该组件就可正常显示产品的内容</p>",
                    CreatebyName = "ZKEASOFT"
                };
            }

            var layout = actionContext.HttpContext.GetLayout();
            if (layout != null && layout.Page != null)
            {
                var page = layout.Page;
                page.MetaDescription = product.SEODescription;
                page.MetaKeyWorlds = product.SEOKeyWord;
                page.Title = product.SEOTitle ?? product.Title;
            }
            return widget.ToWidgetViewModelPart(product);
        }
    }
}