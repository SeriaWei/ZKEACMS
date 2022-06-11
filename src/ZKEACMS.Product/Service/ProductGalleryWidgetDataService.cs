/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Product.Service
{
    public class ProductGalleryWidgetDataService : IProductGalleryWidgetDataService
    {
        private readonly IWidgetBasePartService _widgetBasePartService;
        public ProductGalleryWidgetDataService(IWidgetBasePartService widgetBasePartService)
        {
            _widgetBasePartService = widgetBasePartService;
        }

        public void UpdateDetailPageUrl(string oldUrl, string newUrl)
        {
            var widgets = _widgetBasePartService.GetAllWidgets<ProductGalleryWidgetService, ProductGalleryWidget>();
            List<ProductGalleryWidget> needUpdateWidgets = new List<ProductGalleryWidget>();
            foreach (var item in widgets)
            {
                if (item.DetailPageUrl.IsNullOrEmpty()) continue;

                if (item.DetailPageUrl.Equals(oldUrl, StringComparison.OrdinalIgnoreCase) ||
                    item.DetailPageUrl.StartsWith(oldUrl + "/", StringComparison.OrdinalIgnoreCase))
                {
                    item.DetailPageUrl = newUrl + item.DetailPageUrl.Substring(oldUrl.Length);
                    needUpdateWidgets.Add(item);
                }
            }
            if (needUpdateWidgets.Any())
            {
                _widgetBasePartService.UpdateWidgets(needUpdateWidgets.ToArray());
            }
        }
    }
}
