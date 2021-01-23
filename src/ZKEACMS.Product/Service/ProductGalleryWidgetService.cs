/* http://www.zkea.net/ 
 * Copyright 2021 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
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
        private readonly IProductService _ProductService;
        private readonly IProductGalleryService _ProductGalleryService;
        public ProductGalleryWidgetService(IWidgetBasePartService widgetBasePartService,
            IApplicationContext applicationContext,
            CMSDbContext dbContext,
            IProductService ProductService,
            IProductGalleryService ProductGalleryService)
            : base(widgetBasePartService, applicationContext, dbContext)
        {
            _ProductService = ProductService;
            _ProductGalleryService = ProductGalleryService;
        }
        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            var widget = widgetDisplayContext.Widget as ProductGalleryWidget;
            ProductGalleryWidgetViewModel viewModel = new ProductGalleryWidgetViewModel { DetailPageUrl = widget.DetailPageUrl };
            var ProductGallery = _ProductGalleryService.Get(widget.ProductGalleryId);

            if (ProductGallery == null || ProductGallery.Products.Count() == 0)
            {
                viewModel.Products = Enumerable.Empty<ProductEntity>();
            }
            else
            {
                var ProductIds = ProductGallery.Products.Where(m => m.Product != null).Select(m => m.Product.ProductID).ToArray();
                viewModel.Products = _ProductService.Get(m => ProductIds.Contains(m.ID) && m.IsPublish);
            }
            return viewModel;
        }
    }
}
