using Easy.RepositoryPattern;
using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Theme;
using ZKEACMS.Widget;

namespace ZKEACMS.TemplateImporter.Service
{
    public interface IWidgetCreatorService
    {
        WidgetBase Create(string section, string themeName);
    }
}
