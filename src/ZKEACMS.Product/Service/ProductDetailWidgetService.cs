/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
using Easy.Constant;
using Microsoft.AspNetCore.Html;
using System.Collections.Generic;
using ZKEACMS.StructuredData;
using Easy.Cache;
using Microsoft.Extensions.Caching.Memory;

namespace ZKEACMS.Product.Service
{
    public class ProductDetailWidgetService : WidgetService<ProductDetailWidget>
    {
        private const string ProductDetailWidgetRelatedPageUrls = "ProductDetailWidgetRelatedPageUrls";
        private readonly ICacheManager<ProductDetailWidgetService> _cacheManager;
        private readonly IProductService _productService;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly ISignals _signals;
        public ProductDetailWidgetService(IWidgetBasePartService widgetService,
            IProductService productService,
            IApplicationContext applicationContext,
            ICacheManager<ProductDetailWidgetService> cacheManager,
            CMSDbContext dbContext,
            IHttpContextAccessor httpContextAccessor,
            ISignals signals)
            : base(widgetService, applicationContext, dbContext)
        {
            _productService = productService;
            _cacheManager = cacheManager;
            _httpContextAccessor = httpContextAccessor;
            _signals = signals;
        }
        private void DismissRelatedPageUrls()
        {
            _cacheManager.Remove(ProductDetailWidgetRelatedPageUrls);
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
            var actionContext = widgetDisplayContext.ActionContext;
            int productId = actionContext.RouteData.GetPost();
            ProductEntity product = null;
            if (productId != 0)
            {
                product = actionContext.RouteData.GetProduct(productId) ?? _productService.Get(productId);
                if (!product.IsPublish || product.Status != (int)RecordStatus.Active)
                {
                    actionContext.NotFoundResult();
                    return null;
                }
                if (product != null && product.Url.IsNotNullAndWhiteSpace() && actionContext.RouteData.GetProductUrl().IsNullOrWhiteSpace())
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{product.Url}.html", true);
                    return null;
                }
            }
            else
            {
                if (ApplicationContext.CurrentAppContext().IsDesignMode || ApplicationContext.CurrentAppContext().IsPreViewMode)
                {
                    product = _productService.GetLatestPublished();
                }
                else
                {
                    actionContext.RedirectTo($"{actionContext.RouteData.GetPath()}/{_productService.GetLatestPublished().Url}.html", false);
                    return null;
                }
            }
            if (product == null)
            {
                actionContext.NotFoundResult();
                return null;
            }

            var layout = widgetDisplayContext.PageLayout;
            if (layout != null && layout.Page != null)
            {
                layout.Page.ConfigSEO(product.SEOTitle ?? product.Title, product.SEOKeyWord, product.SEODescription);
                AddStructuredDataToPageHeader(product);
            }
            return product;
        }

        private void AddStructuredDataToPageHeader(ProductEntity product)
        {
            var structuredData = new StructuredData.Product
            {
                Name = product.Title,
                Image = GetImages(product).Where(m => m.IsNotNullAndWhiteSpace()).ToArray(),
                Description = product.Description,
                MPN = product.PartNumber
            };
            IHtmlContent jsonLinkingData = HtmlHelper.SerializeToJsonLinkingData(structuredData);
            ApplicationContext.CurrentAppContext().HeaderPart.Add(jsonLinkingData);
        }
        private IEnumerable<string> GetImages(ProductEntity product)
        {
            yield return ToFullImageUrl(product.ImageUrl);
            yield return ToFullImageUrl(product.ImageThumbUrl);
            foreach (var item in product.ProductImages)
            {
                yield return ToFullImageUrl(item.ImageUrl);
            }
            foreach (var item in HtmlHelper.ParseImageUrls(product.ProductContent))
            {
                yield return ToFullImageUrl(item);
            }
        }

        private string ToFullImageUrl(string url)
        {
            if (url.IsNullOrEmpty() ||
                url.StartsWith("http://", StringComparison.OrdinalIgnoreCase) ||
                url.StartsWith("https://", StringComparison.OrdinalIgnoreCase)) return url;

            return _httpContextAccessor.HttpContext.GetUrlWithHost(url);
        }

        public string[] GetRelatedPageUrls()
        {
            return _cacheManager.GetOrCreate(ProductDetailWidgetRelatedPageUrls, fac =>
            {
                fac.AddExpirationToken(_signals.When(CacheSignals.PageUrlChanged));

                var pages = WidgetBasePartService.Get(w => Get().Select(m => m.ID).Contains(w.ID)).Select(m => m.PageId).ToArray();
                return DbContext.Page.Where(p => pages.Contains(p.ID)).Select(m => m.Url.Replace("~/", "/")).Distinct().ToArray();
            });
        }
    }
}