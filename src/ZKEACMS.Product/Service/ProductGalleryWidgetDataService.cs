/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using Newtonsoft.Json;
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
        const string Assembly = "ZKEACMS.Product";
        const string WidgetServiceType = "ZKEACMS.Product.Service.ProductGalleryWidgetService";

        private readonly IWidgetBasePartService _widgetBasePartService;
        public ProductGalleryWidgetDataService(IWidgetBasePartService widgetBasePartService)
        {
            _widgetBasePartService = widgetBasePartService;
        }

        public void UpdateDetailPageUrl(string oldUrl, string newUrl)
        {
            var widgets = _widgetBasePartService.Get(m => m.AssemblyName == Assembly && m.ServiceTypeName == WidgetServiceType);
            List<WidgetBasePart> needUpdateWidgets = new List<WidgetBasePart>();
            foreach (var item in widgets)
            {
                if (item.ExtendData.IsNullOrEmpty()) continue;

                var listWidget = JsonConvert.DeserializeObject<ProductGalleryWidget>(item.ExtendData);
                if (listWidget.DetailPageUrl.IsNullOrEmpty()) continue;

                if (listWidget.DetailPageUrl.Equals(oldUrl, StringComparison.OrdinalIgnoreCase) ||
                    listWidget.DetailPageUrl.StartsWith(oldUrl + "/", StringComparison.OrdinalIgnoreCase))
                {
                    listWidget.DetailPageUrl = newUrl + listWidget.DetailPageUrl.Substring(oldUrl.Length);
                    item.CopyTo(listWidget);
                    item.ExtendData = JsonConvert.SerializeObject(listWidget);
                    needUpdateWidgets.Add(item);
                }
            }
            if (needUpdateWidgets.Any())
            {
                _widgetBasePartService.UpdateRange(needUpdateWidgets.ToArray());
            }
        }
    }
}
