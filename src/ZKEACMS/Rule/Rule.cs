/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ZKEACMS.Rule
{
    [DataTable("CMS_Rule")]
    public class Rule : EditorEntity
    {
        public Rule()
        {
            RuleItemList = new List<RuleItem>();
        }
        [Key]
        public int RuleID { get; set; }
        public string ZoneName { get; set; }
        public string RuleExpression { get; set; }
        public string RuleItems { get; set; }
        [NotMapped]
        public List<RuleItem> RuleItemList { get; set; }
    }
    class RuleMetaData : ViewMetaData<Rule>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.RuleID).AsHidden();
            ViewConfig(m => m.RuleExpression).AsHidden();
            ViewConfig(m => m.RuleItems).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Order(1).Required();
            ViewConfig(m => m.ZoneName).AsTextBox().Order(2).Required();
            ViewConfig(m => m.RuleItemList).AsListEditor().Order(3);
        }
    }
}
