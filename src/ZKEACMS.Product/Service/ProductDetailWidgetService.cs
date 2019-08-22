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
using System.Collections.Concurrent;

namespace ZKEACMS.Product.Service
{
    public class ProductDetailWidgetService : WidgetService<ProductDetailWidget>
    {
        private const string ProductDetailWidgetRelatedPageUrls = "ProductDetailWidgetRelatedPageUrls";
        private readonly ConcurrentDictionary<string, object> _allRelatedUrlCache;
        private readonly IProductService _productService;
        public ProductDetailWidgetService(IWidgetBasePartService widgetService,
            IProductService productService,
            IApplicationContext applicationContext,
            Easy.Cache.ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _productService = productService;
            _allRelatedUrlCache = cacheManager.GetOrAdd(ProductDetailWidgetRelatedPageUrls, new ConcurrentDictionary<string, object>());
        }
        private void DismissRelatedPageUrls()
        {
            _allRelatedUrlCache.TryRemove(ProductDetailWidgetRelatedPageUrls, out var urls);
        }

        public override void AddWidget(WidgetBase widget)
        {
            base.AddWidget(widget);
            DismissRelatedPageUrls();
        }

        public override void DeleteWidget(string widgetId)
        {
            base.DeleteWidget(widgetId);
            DismissRelatedPageUrls();
        }
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            int productId = actionContext.RouteData.GetPost();
            ProductEntity product = null;
            if (productId != 0)
            {
                product = actionContext.RouteData.GetProduct(productId) ?? _productService.Get(productId);
                if (product != null && product.Url.IsNotNullAndWhiteSpace() && actionContext.RouteData.GetProductUrl().IsNullOrWhiteSpace())
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{product.Url}.html", true);
                }
            }
            if (product == null && ApplicationContext.IsAuthenticated)
            {
                product = _productService.Get().OrderByDescending(m => m.ID).FirstOrDefault();
                if (product != null)
                {
                    product = _productService.Get(product.ID);
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

        public string[] GetRelatedPageUrls()
        {
            return _allRelatedUrlCache.GetOrAdd(ProductDetailWidgetRelatedPageUrls, fac =>
            {
                var pages = WidgetBasePartService.Get(w => Get().Select(m => m.ID).Contains(w.ID)).Select(m => m.PageID).ToArray();
                return DbContext.Page.Where(p => pages.Contains(p.ID)).Select(m => m.Url.Replace("~/", "/")).Distinct().ToArray();
            }) as string[];
        }
    }
}