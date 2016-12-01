/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ZKEACMS.SectionWidget.Models
{

    public abstract class SectionContentBase : EditorEntity
    {

        public enum Types
        {
            None = 0,
            CallToAction = 1,
            Image = 2,
            Paragraph = 3,
            Title = 4,
            Video = 5
        }
        [Key]
        public int ID { get; set; }
        public string SectionWidgetId { get; set; }
        public virtual int? SectionGroupId { get; set; }
        public virtual int? Order { get; set; }
        public abstract int SectionContentType
        {
            get;
            set;
        }
    }
    [Table("SectionContent")]
    public class SectionContent : SectionContentBase
    {
        public override int SectionContentType
        {
            get;
            set;
        }

        public SectionContent InitContent(SectionContent content)
        {
            content.SectionWidgetId = SectionWidgetId;
            content.SectionGroupId = SectionGroupId;
            content.Order = Order;
            return content;
        }
        [NotMapped]
        public override string Description { get; set; }
        [NotMapped]
        public override int? Status { get; set; }
        [NotMapped]
        public override string Title { get; set; }
    }

    public class SectionContentBasic : SectionContent
    {
        [NotMapped]
        public override string CreateBy { get; set; }
        [NotMapped]
        public override DateTime? CreateDate { get; set; }
        [NotMapped]
        public override string CreatebyName { get; set; }
        [NotMapped]
        public override string LastUpdateBy { get; set; }
        [NotMapped]
        public override DateTime? LastUpdateDate { get; set; }
        [NotMapped]
        public override string LastUpdateByName { get; set; }
        [NotMapped]
        public override int? Order { get; set; }
        [NotMapped]
        public override int? SectionGroupId { get; set; }
    }
}