using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.FormGenerator.Models
{
    [DataTable("Forms")]
    public class Form : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public string NotificationReceiver { get; set; }
        [NotMapped]
        public List<FormField> FormFields { get; set; }
        public string FieldsData { get; set; }
    }
    class FormMetaData : ViewMetaData<Form>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Status).AsHidden();
            ViewConfig(m => m.FieldsData).AsTextArea();
            ViewConfig(m => m.NotificationReceiver).AsTextBox();
        }
    }
}
