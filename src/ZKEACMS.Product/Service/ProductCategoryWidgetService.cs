/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
using Easy.Constant;
using Easy.Cache;
using Microsoft.Extensions.Caching.Memory;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryWidgetService : WidgetService<ProductCategoryWidget>
    {
        private const string ProductCategoryWidgetRelatedPageUrls = "ProductCategoryWidgetRelatedPageUrls";
        private readonly ICacheManager<ProductCategoryWidgetService> _cacheManager;
        private readonly IProductCategoryService _productCategoryService;
        private readonly ISignals _signals;
        public ProductCategoryWidgetService(IWidgetBasePartService widgetService,
            IProductCategoryService productCategoryService,
            IApplicationContext applicationContext,
            ICacheManager<ProductCategoryWidgetService> cacheManager,
            CMSDbContext dbContext,
            ISignals signals)
            : base(widgetService, applicationContext, dbContext)
        {
            _productCategoryService = productCategoryService;
            _cacheManager = cacheManager;
            _signals = signals;
        }
        private void DismissRelatedPageUrls()
        {
            _cacheManager.Remove(ProductCategoryWidgetRelatedPageUrls);
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
        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            ProductCategoryWidget currentWidget = widgetDisplayContext.Widget as ProductCategoryWidget;
            var actionContext = widgetDisplayContext.ActionContext;
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
            if (productCategory != null && productCategory.SEOTitle.IsNotNullAndWhiteSpace())
            {
                ApplicationContext.Current().CurrentPage.ConfigSEO(productCategory.SEOTitle, productCategory.SEOKeyWord, productCategory.SEODescription);
            }
            return new ProductCategoryWidgetViewModel
            {
                Widget = currentWidget,
                Categorys = _productCategoryService.Get().Where(m => m.Status == (int)RecordStatus.Active && m.ParentID == currentWidget.ProductCategoryID).OrderBy(m => m.DisplayOrder ?? m.ID).ToList(),
                CurrentCategory = cate
            };
        }

        public string[] GetRelatedPageUrls()
        {
            return _cacheManager.GetOrCreate(ProductCategoryWidgetRelatedPageUrls, factory =>
            {
                factory.AddExpirationToken(_signals.When(CacheSignals.PageUrlChanged));

                var pages = WidgetBasePartService.Get(w => Get().Select(m => m.ID).Contains(w.ID)).Select(m => m.PageId).ToArray();
                return DbContext.Page.Where(p => pages.Contains(p.ID)).Select(m => m.Url.Replace("~/", "/")).Distinct().ToArray();
            });
        }
    }
}