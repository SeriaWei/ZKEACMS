/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Setting
{
    [DataTable("ApplicationSetting")]
    public class ApplicationSetting : EditorEntity
    {
        [Key]
        public string SettingKey { get; set; }
        public string Value { get; set; }
    }

    class ApplicationSettingMedaData : ViewMetaData<ApplicationSetting>
    {

        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Title).AsHidden();
            ViewConfig(m => m.SettingKey).AsTextBox().Required().ShowInGrid();
            ViewConfig(m => m.Value).AsTextBox().Required().ShowInGrid();
        }
    }
}