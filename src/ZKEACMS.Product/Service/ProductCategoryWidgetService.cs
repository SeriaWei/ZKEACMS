/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using ZKEACMS.Product.Models;
using ZKEACMS.Product.ViewModel;
using Easy.Extend;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Http;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using System.Collections.Concurrent;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryWidgetService : WidgetService<ProductCategoryWidget>
    {
        private const string ProductCategoryWidgetRelatedPageUrls = "ProductCategoryWidgetRelatedPageUrls";
        private readonly ConcurrentDictionary<string, object> _allRelatedUrlCache;
        private readonly IProductCategoryService _productCategoryService;
        public ProductCategoryWidgetService(IWidgetBasePartService widgetService,
            IProductCategoryService productCategoryService,
            IApplicationContext applicationContext,
            Easy.Cache.ICacheManager<ConcurrentDictionary<string, object>> cacheManager,
            CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _productCategoryService = productCategoryService;
            _allRelatedUrlCache = cacheManager.GetOrAdd(ProductCategoryWidgetRelatedPageUrls, new ConcurrentDictionary<string, object>());
        }
        private void DismissRelatedPageUrls()
        {
            _allRelatedUrlCache.TryRemove(ProductCategoryWidgetRelatedPageUrls, out var urls);
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
            ProductCategoryWidget currentWidget = widget as ProductCategoryWidget;
            int cate = actionContext.RouteData.GetCategory();
            ProductCategory productCategory = null;
            if (cate > 0)
            {
                productCategory = _productCategoryService.Get(cate);
            }
            if (actionContext.RouteData.GetCategoryUrl().IsNullOrEmpty() && productCategory != null)
            {
                if (productCategory.Url.IsNotNullAndWhiteSpace())
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{productCategory.Url}", true);
                }
            }
            if (productCategory != null)
            {
                var layout = actionContext.HttpContext.GetLayout();
                if (layout != null && layout.Page != null)
                {
                    layout.Page.Title = productCategory.SEOTitle ?? productCategory.Title;
                    layout.Page.MetaKeyWorlds = productCategory.SEOKeyWord;
                    layout.Page.MetaDescription = productCategory.SEODescription;
                }
            }
            return widget.ToWidgetViewModelPart(new ProductCategoryWidgetViewModel
            {
                Categorys = _productCategoryService.Get(m => m.ParentID == currentWidget.ProductCategoryID),
                CurrentCategory = cate
            });
        }

        public string[] GetRelatedPageUrls()
        {
            return _allRelatedUrlCache.GetOrAdd(ProductCategoryWidgetRelatedPageUrls, fac =>
            {
                var pages = WidgetBasePartService.Get(w => Get().Select(m => m.ID).Contains(w.ID)).Select(m => m.PageID).ToArray();
                return DbContext.Page.Where(p => pages.Contains(p.ID)).Select(m => m.Url.Replace("~/", "/")).Distinct().ToArray();
            }) as string[];
        }
    }
}