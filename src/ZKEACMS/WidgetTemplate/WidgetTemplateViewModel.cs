/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;

namespace ZKEACMS.WidgetTemplate
{
    public class WidgetTemplateViewModel
    {
        public string PageID { get; set; }
        public string LayoutID { get; set; }
        public string ZoneID { get; set; }
        public int? RuleID { get; set; }
        public bool CanPasteWidget { get; set; }
        public string ReturnUrl { get; set; }
        public List<WidgetTemplateEntity> WidgetTemplates { get; set; }
    }
}
