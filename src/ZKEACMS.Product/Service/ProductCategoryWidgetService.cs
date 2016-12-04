/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using ZKEACMS.Product.Models;
using ZKEACMS.Product.ViewModel;
using Easy.Extend;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Http;
using Easy;

namespace ZKEACMS.Product.Service
{
    public class ProductCategoryWidgetService : WidgetService<ProductCategoryWidget>
    {
        private readonly IProductCategoryService _productCategoryService;
        public ProductCategoryWidgetService(IWidgetService widgetService, IProductCategoryService productCategoryService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _productCategoryService = productCategoryService;
        }

        public override WidgetPart Display(WidgetBase widget, HttpContext httpContext)
        {
            ProductCategoryWidget currentWidget = widget as ProductCategoryWidget;
            int c;
            int.TryParse(httpContext.Request.Query["pc"].ToString(), out c);
            return widget.ToWidgetPart(new ProductCategoryWidgetViewModel
            {
                Categorys = _productCategoryService.Get(m => m.ParentID == currentWidget.ProductCategoryID),
                CurrentCategory = c,
                TargetPage = currentWidget.TargetPage.IsNullOrEmpty() ? httpContext.Request.Path.ToString().ToLower() : currentWidget.TargetPage
            });
        }
    }
}