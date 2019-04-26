using Easy.MetaData;
using Easy.RepositoryPattern;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ZKEACMS.TemplateImporter.Models
{
    [DataTable("TemplateImporter")]
    public class TemplateImporter : EditorEntity
    {
        [Key]
        public int ID { get; set; }
    }
    class TemplateImporterMetaData : ViewMetaData<TemplateImporter>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
        }
    }
}
