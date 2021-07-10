/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Linq;
using ZKEACMS.Product.Service;
using ZKEACMS.Event;
using ZKEACMS.Page;

namespace ZKEACMS.Product.EventHandler
{
    public class UpdateDetailPageUrlOnPageUrlChangedEventHandler : IEventHandler
    {
        private readonly IProductListWidgetDataService _productListWidgetService;
        private readonly IProductGalleryWidgetDataService _productGalleryWidgetDataService;

        public UpdateDetailPageUrlOnPageUrlChangedEventHandler(IProductListWidgetDataService articleListWidgetService, 
            IProductGalleryWidgetDataService productGalleryWidgetDataService)
        {
            _productListWidgetService = articleListWidgetService;
            _productGalleryWidgetDataService = productGalleryWidgetDataService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                string oldPageUrl = e.Data.ToString();
                _productListWidgetService.UpdateDetailPageUrl(oldPageUrl, page.Url);
                _productGalleryWidgetDataService.UpdateDetailPageUrl(oldPageUrl, page.Url);
            }
        }
    }
}
