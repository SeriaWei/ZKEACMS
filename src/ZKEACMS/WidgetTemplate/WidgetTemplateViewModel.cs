/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using ZKEACMS.Widget;

namespace ZKEACMS.WidgetTemplate
{
    public class WidgetTemplateViewModel
    {
        public string PageId { get; set; }
        public string LayoutId { get; set; }
        public string ZoneId { get; set; }
        public int? RuleID { get; set; }
        public bool CanPasteWidget { get; set; }
        public string ReturnUrl { get; set; }
        public List<WidgetTemplateEntity> WidgetTemplates { get; set; }
        public List<WidgetBasePart> PredefinedTemplates { get; set; }
    }
}
