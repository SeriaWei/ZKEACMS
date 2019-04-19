/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.MetaData;
using Easy.Models;
using Easy.RepositoryPattern;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ZKEACMS.Extend;

namespace ZKEACMS.Common.Models
{
    [DataTable("Navigation")]
    public class NavigationEntity : EditorEntity
    {
        [Key]
        public string ID { get; set; }
        public int? DisplayOrder { get; set; }
        public bool? IsMobile { get; set; }
        public string ParentId { get; set; }
        public string Url { get; set; }
        public string Html { get; set; }
        [NotMapped]
        public bool IsCurrent { get; set; }
    }
    class NavigationEntityMeta : ViewMetaData<NavigationEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.ParentId).AsHidden();
            ViewConfig(m => m.DisplayOrder).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Required().Order(1);
            ViewConfig(m => m.Url).AsTextBox().Required().Order(2).PageSelector();
            ViewConfig(m => m.IsMobile).AsCheckBox().Order(3);
            ViewConfig(m => m.Html).AsTextArea().Order(4);
            ViewConfig(m => m.IsCurrent).AsHidden();
        }
    }

}