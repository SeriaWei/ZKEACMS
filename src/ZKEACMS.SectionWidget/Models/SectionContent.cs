/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Easy.RepositoryPattern;

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
        public string ID { get; set; }
        public string SectionWidgetId { get; set; }
        public virtual string SectionGroupId { get; set; }
        public virtual int? Order { get; set; }
        public abstract int SectionContentType
        {
            get;
            set;
        }
    }

    public class SectionContent : SectionContentBase
    {
        public override int SectionContentType
        {
            get;
            set;
        }

        public SectionContent InitContent(SectionContent content)
        {
            if (content != null)
            {
                content.SectionWidgetId = SectionWidgetId;
                content.SectionGroupId = SectionGroupId;
                content.Order = Order;
            }
            return content;
        }
        [NotMapped]
        public override string Description { get; set; }
        [NotMapped]
        public override int? Status { get; set; }
        [NotMapped]
        public override string Title { get; set; }
        public SectionContentBasePart ToContent()
        {
            return new SectionContentBasePart
            {
                ActionType = ActionType,
                ID = ID,
                SectionWidgetId = SectionWidgetId,
                SectionGroupId = SectionGroupId,
                SectionContentType = SectionContentType,
                Order = Order,
                CreateBy = CreateBy,
                CreatebyName = CreatebyName,
                CreateDate = CreateDate,
                LastUpdateBy = LastUpdateBy,
                LastUpdateByName = LastUpdateByName,
                LastUpdateDate = LastUpdateDate,
                Title = Title,
                Status = Status,
                Description = Description
            };
        }
        public SectionContentBasePart CopyTo(SectionContentBasePart sectionContentBasePart)
        {
            sectionContentBasePart.ActionType = ActionType;
            sectionContentBasePart.ID = ID;
            sectionContentBasePart.SectionWidgetId = SectionWidgetId;
            sectionContentBasePart.SectionGroupId = SectionGroupId;
            sectionContentBasePart.SectionContentType = SectionContentType;
            sectionContentBasePart.Order = Order;
            sectionContentBasePart.CreateBy = CreateBy;
            sectionContentBasePart.CreatebyName = CreatebyName;
            sectionContentBasePart.CreateDate = CreateDate;
            sectionContentBasePart.LastUpdateBy = LastUpdateBy;
            sectionContentBasePart.LastUpdateByName = LastUpdateByName;
            sectionContentBasePart.LastUpdateDate = LastUpdateDate;
            sectionContentBasePart.Title = Title;
            sectionContentBasePart.Status = Status;
            sectionContentBasePart.Description = Description;
            return sectionContentBasePart;
        }
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
        public override string SectionGroupId { get; set; }
    }
    [DataTable("SectionContent")]
    public class SectionContentBasePart : SectionContent
    {

    }
}