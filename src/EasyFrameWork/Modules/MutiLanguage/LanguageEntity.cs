/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.ComponentModel.DataAnnotations;
using Easy.MetaData;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.Models;

namespace Easy.Modules.MutiLanguage
{
    [Table("Language")]
    public class LanguageEntity
    {
        [Key]
        public string LanKey { get; set; }
        public string CultureName { get; set; }
        public string LanValue { get; set; }
        public string Module { get; set; }
        public string LanType { get; set; }
    }
    class LanguageEntityMetaData : ViewMetaData<LanguageEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.CultureName).AsTextBox().ReadOnly().ShowInGrid();
            ViewConfig(m => m.LanKey).AsTextBox().ReadOnly().ShowInGrid().Search(LINQ.Query.Operators.Contains);
            ViewConfig(m => m.LanType).AsTextBox().ReadOnly();
            ViewConfig(m => m.Module).AsTextBox().ReadOnly();
            ViewConfig(m => m.LanValue).AsTextBox().Required().ShowInGrid().Search(LINQ.Query.Operators.Contains);
        }
    }

}
