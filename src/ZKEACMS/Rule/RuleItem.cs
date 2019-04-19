/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Constant;
using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Rule
{
    public class RuleItem: EditorEntity
    {
        public string Condition { get; set; }
        public string FunctionName { get; set; }
        public string Property { get; set; }
        public string Value { get; set; }
    }
    class RuleItemMetaData : ViewMetaData<RuleItem>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.Condition).AsDropDownList().Order(1).DataSource(SourceType.Dictionary);
            ViewConfig(m => m.Property).AsDropDownList().Order(2).DataSource(SourceType.Dictionary);
            ViewConfig(m => m.FunctionName).AsDropDownList().Order(3).DataSource(SourceType.Dictionary);
            ViewConfig(m => m.Value).AsTextBox().Order(4).Required();
        }
    }
}
