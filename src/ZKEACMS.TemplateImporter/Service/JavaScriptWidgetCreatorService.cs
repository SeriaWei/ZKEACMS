using System;
using HtmlAgilityPack;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.TemplateImporter.Service
{
    public class JavaScriptWidgetCreatorService : IWidgetCreatorService
    {
        public WidgetBase Create(string section, string themeName)
        {
            if (section.IndexOf("<script", StringComparison.OrdinalIgnoreCase) == 0)
            {
                return new ScriptWidget
                {
                    AssemblyName = "ZKEACMS",
                    PartialView = "Widget.Script",
                    ServiceTypeName = "ZKEACMS.Common.Service.ScriptWidgetService",
                    ViewModelTypeName = "ZKEACMS.Common.Models.ScriptWidget",
                    StyleClass = "full",
                    Script = section
                };
            }
            return null;
        }
    }
}