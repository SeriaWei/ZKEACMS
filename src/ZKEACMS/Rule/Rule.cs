using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace ZKEACMS.Rule
{
    [Table("CMS_Rule")]
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
            ViewConfig(m => m.RuleItemList).AsListEditor();
        }
    }
}
