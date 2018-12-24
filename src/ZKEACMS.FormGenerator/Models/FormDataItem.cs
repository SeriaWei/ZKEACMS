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
    [DataTable("FormDataItem")]
    public class FormDataItem : EditorEntity
    {
        [Key]
        public int ID { get; set; }
        public int FormDataId { get; set; }
        public string FieldId { get; set; }
        public string FieldText { get; set; }
        public string FieldValue { get; set; }
        public string OptionValue { get; set; }
        [NotMapped]
        public override string Title { get => base.Title; set => base.Title = value; }
        [NotMapped]
        public override int? Status { get => base.Status; set => base.Status = value; }
        [NotMapped]
        public override string Description { get => base.Description; set => base.Description = value; }
    }
}
