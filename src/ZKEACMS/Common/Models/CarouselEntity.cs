/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using Easy.MetaData;
using Easy.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Easy.RepositoryPattern;

namespace ZKEACMS.Common.Models
{
    [DataTable("Carousel")]
    public class CarouselEntity : EditorEntity
    {
        public CarouselEntity()
        {
            CarouselItems = new List<CarouselItemEntity>();
        }
        [Key]
        public int ID { get; set; }

        public int? Height { get; set; }
        [NotMapped]
        public List<CarouselItemEntity> CarouselItems { get; set; }

    }
    class CarouselEntityMetaData : ViewMetaData<CarouselEntity>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.Title).AsTextBox().Required().Order(1).ShowInGrid();
            ViewConfig(m => m.CarouselItems).AsListEditor().Order(2);
            ViewConfig(m => m.Height).AsHidden();
        }
    }

}