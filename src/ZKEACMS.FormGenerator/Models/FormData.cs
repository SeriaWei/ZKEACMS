using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.FormGenerator.Service;

namespace ZKEACMS.FormGenerator.Models
{
    [DataTable("FormData")]
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
            ViewConfig(m => m.FormId).AsDropDownList().DataSource(() =>
            {
                return Easy.ServiceLocator.GetService<IFormService>().Get().ToDictionary(m => m.ID, m => m.Title);
            }).ShowInGrid();
        }
    }
}
