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
    [ViewConfigure(typeof(FormMetaData)), Table("Forms")]
    public class Form : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        [NotMapped]
        public List<FormField> FormFields { get; set; }
        public string FieldsData { get; set; }
    }
    class FormMetaData : ViewMetaData<Form>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Status).AsHidden();
        }
    }
}
