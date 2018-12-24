/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ZKEACMS.Media
{
    [DataTable("CMS_Media")]
    public class MediaEntity : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public string ParentID { get; set; }
        public int MediaType { get; set; }
        public string Url { get; set; }

        public string MediaTypeImage
        {
            get { return ((MediaType)MediaType).ToString().ToLower(); }
        }
    }

    class MediaEntityMetaData : ViewMetaData<MediaEntity>
    {
        protected override void ViewConfigure()
        {

        }
    }
}
