using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.FormGenerator.Models
{
    [ViewConfigure(typeof(FormDataMetaData)), Table("FormData")]
    public class FormData : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public string FormId { get; set; }
        [NotMapped]
        public Form Form { get; set; }
        [NotMapped]
        public List<FormDataItem> Datas { get; set; }
    }
    class FormDataMetaData : ViewMetaData<FormData>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Status).AsHidden();
        }
    }
}
