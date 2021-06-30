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

        public UpdateDetailPageUrlOnPageUrlChangedEventHandler(IProductListWidgetDataService articleListWidgetService)
        {
            _productListWidgetService = articleListWidgetService;
        }

        public void Handle(object entity, EventArg e)
        {
            PageEntity page = entity as PageEntity;
            if (page != null && e.Data != null)
            {
                string oldPageUrl = e.Data.ToString();
                _productListWidgetService.UpdateDetailPageUrl(oldPageUrl, page.Url);
            }
        }
    }
}
