using Easy.RepositoryPattern;
using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Common.Models;
using ZKEACMS.Theme;
using ZKEACMS.Widget;

namespace ZKEACMS.TemplateImporter.Service
{
    public class WdigetCreatorManager : IWdigetCreatorManager
    {
        private readonly IEnumerable<IWidgetCreatorService> _widgetCreators;
        public WdigetCreatorManager(IEnumerable<IWidgetCreatorService> widgetCreators)
        {
            _widgetCreators = widgetCreators;
        }

        public WidgetBase Create(string section, string themeName)
        {
            foreach (var item in _widgetCreators)
            {
                WidgetBase widget = item.Create(section, themeName);
                if (widget != null)
                {
                    return widget;
                }
            }
            return new HtmlWidget
            {
                AssemblyName = "ZKEACMS",
                PartialView = "Widget.HTML",
                ServiceTypeName = "ZKEACMS.Common.Service.HtmlWidgetService",
                ViewModelTypeName = "ZKEACMS.Common.Models.HtmlWidget",
                HTML = section
            };
        }
    }
}
