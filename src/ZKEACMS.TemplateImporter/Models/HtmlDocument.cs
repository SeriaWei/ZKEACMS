using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.TemplateImporter.Models
{
    public class HtmlDocument : HtmlAgilityPack.HtmlDocument
    {
        public string PageName { get; set; }
    }
}
