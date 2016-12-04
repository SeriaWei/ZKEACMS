/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.ViewModel;
using ZKEACMS.Widget;
using System.Linq;
using Easy;

namespace ZKEACMS.Product.Service
{
    public class ProductListWidgetService : WidgetService<ProductListWidget>
    {
        private readonly IProductService _productService;
        public ProductListWidgetService(IWidgetService widgetService, IProductService productService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _productService = productService;
        }

        public override void Add(ProductListWidget item)
        {
            if (!item.PageSize.HasValue || item.PageSize.Value == 0)
            {
                item.PageSize = 20;
            }
            base.Add(item);
        }
        public override WidgetPart Display(WidgetBase widget, HttpContext httpContext)
        {
            ProductListWidget pwidget = widget as ProductListWidget;
            IEnumerable<ProductEntity> products = null;
            int p;
            int.TryParse(httpContext.Request.Query["p"].ToString(), out p);
            var page = new Pagination { PageIndex = p, PageSize = pwidget.PageSize ?? 20 };
            if (pwidget.IsPageable)
            {
                products = _productService.Get(m => m.IsPublish == true, page);
            }
            else
            {
                products = _productService.Get(m => m.IsPublish == true);
            }


            int c;
            if (int.TryParse(httpContext.Request.Query["pc"].ToString(), out c))
            {
                products.Where(m => m.ProductCategoryID == c);
            }
            else
            {
                products.Where(m => m.ProductCategoryID == pwidget.ProductCategoryID);
            }

            return widget.ToWidgetPart(new ProductListWidgetViewModel
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