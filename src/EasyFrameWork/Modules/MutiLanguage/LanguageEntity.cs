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
            ViewConfig(m => m.CultureName).AsTextBox().ShowInGrid().ReadOnly();
            ViewConfig(m => m.LanKey).AsTextBox().ShowInGrid().Search(LINQ.Query.Operators.Contains).SetGridColumnTemplate("<a href=\"/admin/Language/Edit/{lanKey}\">{lanKey}</a>").ReadOnly();
            ViewConfig(m => m.LanType).AsTextBox();
            ViewConfig(m => m.Module).AsTextBox();
            ViewConfig(m => m.LanValue).AsTextBox().Required().ShowInGrid().Search(LINQ.Query.Operators.Contains);
        }
    }

}
