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
using ZKEACMS.Article.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Article.Service
{
    public class ArticleGalleryWidgetDataService : IArticleGalleryWidgetDataService
    {
        const string Assembly = "ZKEACMS.Article";
        const string WidgetServiceType = "ZKEACMS.Article.Service.ArticleGalleryWidgetService";

        private readonly IWidgetBasePartService _widgetBasePartService;
        public ArticleGalleryWidgetDataService(IWidgetBasePartService widgetBasePartService)
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

                var listWidget = JsonConvert.DeserializeObject<ArticleGalleryWidget>(item.ExtendData);
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
