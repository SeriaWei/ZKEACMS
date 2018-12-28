/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using Easy.Models;
using ZKEACMS;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using ZKEACMS.Extend;
using Easy.RepositoryPattern;

namespace ZKEACMS.Common.Models
{
    [DataTable("CarouselItem")]
    public class CarouselItemEntity : EditorEntity
    {
        [Key]
        public int ID { get; set; }

        public int CarouselID { get; set; }
        public string CarouselWidgetID { get; set; }

        public string TargetLink { get; set; }
        public string ImageUrl { get; set; }

    }
    class CarouselItemEntityMeta : ViewMetaData<CarouselItemEntity>
    {

        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.CarouselID).AsHidden();
            ViewConfig(m => m.CarouselWidgetID).AsHidden();
            ViewConfig(m => m.Description).AsHidden();
            ViewConfig(m => m.TargetLink).AsTextBox().PageSelector();
            ViewConfig(m => m.ImageUrl).AsTextBox().MediaSelector().Required();
        }
    }

}