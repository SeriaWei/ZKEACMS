/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ZKEACMS.ExtendField
{
    [Table("ExtendField")]
    public class ExtendFieldEntity : EditorEntity
    {
        [Key]
        public int? ID { get; set; }
        public string OwnerModule { get; set; }
        public string OwnerID { get; set; }
        public string Value { get; set; }
    }

    class ExtendFieldEntityMetaData : ViewMetaData<ExtendFieldEntity>
    {


        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.OwnerModule).AsHidden();
            ViewConfig(m => m.OwnerID).AsHidden();
            ViewConfig(m => m.Description).AsTextBox();
        }
    }
}