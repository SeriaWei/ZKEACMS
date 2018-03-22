/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.DataArchived
{
    [Table("DataArchived")]
    public class DataArchived : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public string Data { get; set; }
    }

    class DataArchivedMetaData : ViewMetaData<DataArchived>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Data).AsTextArea();
        }
    }
}