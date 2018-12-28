/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Zone
{
    [DataTable("CMS_Zone")]
    public class ZoneEntity : EditorEntity
    {
        public const string ZoneTag = "<zone>";
        public const string ZoneEndTag = "</zone>";
        [Key]
        public string ID { get; set; }
        public string LayoutId { get; set; }
        public string PageId { get; set; }
        public string ZoneName { get; set; }
        public string HeadingCode { get; set; }
    }

    class ZoneEntityMetaData : ViewMetaData<ZoneEntity>
    {
        protected override void ViewConfigure()
        {

        }
    }

}
