/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.ViewModel;
using ZKEACMS.Widget;

namespace ZKEACMS.Product.Service
{
    public class ProductGalleryWidgetService : SimpleWidgetService<ProductGalleryWidget>
    {
        private readonly IProductService _productService;
        private readonly IProductGalleryService _productGalleryService;
        public ProductGalleryWidgetService(IWidgetBasePartService widgetBasePartService,
            IApplicationContext applicationContext,
            CMSDbContext dbContext,
            IProductService productService,
            IProductGalleryService ProductGalleryService)
            : base(widgetBasePartService, applicationContext, dbContext)
        {
            _productService = productService;
            _productGalleryService = ProductGalleryService;
        }
        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            var widget = widgetDisplayContext.Widget as ProductGalleryWidget;
            ProductGalleryWidgetViewModel viewModel = new ProductGalleryWidgetViewModel { DetailPageUrl = widget.DetailPageUrl };
            var productGallery = _productGalleryService.Get(widget.ProductGalleryId);

            if (productGallery == null || productGallery.Products.Count() == 0)
            {
                viewModel.Products = Enumerable.Empty<ProductEntity>();
            }
            else
            {
                var productIds = productGallery.Products.Where(m => m.Product != null && m.Status == (int)RecordStatus.Active)
                    .Select(m => m.Product.ProductID)
                    .ToArray();

                viewModel.Products = _productService.Get(m => productIds.Contains(m.ID) && m.IsPublish).OrderBy(m => Array.IndexOf(productIds, m.ID)).ToList();
            }
            return viewModel;
        }
    }
}
