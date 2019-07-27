using System;
using HtmlAgilityPack;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.TemplateImporter.Service
{
    public class StyleSheetWidgetCreatorService : IWidgetCreatorService
    {
        public WidgetBase Create(string section, string themeName)
        {
            if (section.IndexOf("<style", StringComparison.OrdinalIgnoreCase) == 0)
            {
                return new StyleSheetWidget
                {
                    AssemblyName = "ZKEACMS",
                    PartialView = "Widget.StyleSheet",
                    ServiceTypeName = "ZKEACMS.Common.Service.StyleSheetWidgetService",
                    ViewModelTypeName = "ZKEACMS.Common.Models.StyleSheetWidget",
                    StyleClass = "full",
                    StyleSheet = section
                };
            }
            return null;
        }
    }
}