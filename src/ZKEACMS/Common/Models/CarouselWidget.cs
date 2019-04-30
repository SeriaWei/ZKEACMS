/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using ZKEACMS.Common.Service;
using Easy.Extend;
using Easy.MetaData;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;
using Easy;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Microsoft.Extensions.DependencyInjection;
using Easy.Constant;
using Easy.RepositoryPattern;

namespace ZKEACMS.Common.Models
{
    [DataTable("CarouselWidget")]
    public class CarouselWidget : BasicWidget
    {
        public CarouselWidget()
        {
            CarouselItems = new List<CarouselItemEntity>();
        }
        public int? CarouselID { get; set; }
        [NotMapped]
        public IEnumerable<CarouselItemEntity> CarouselItems { get; set; }
    }
    class CarouselWidgetMetaData : WidgetMetaData<CarouselWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.ID).AsHidden();
            ViewConfig(m => m.CarouselID).AsDropDownList().Order(NextOrder()).DataSource(() =>
            {
                var result = new Dictionary<string, string> { { "", "---请选择---" } };
                using (var carouselService = ServiceLocator.GetService<ICarouselService>())
                {
                    carouselService.Get().Each(m => result.Add(m.ID.ToString(), m.Title));
                    return result;
                }
            });
            ViewConfig(m => m.CarouselItems).AsListEditor().Order(NextOrder());
            ViewConfig(m => m.PartialView).AsDropDownList().Order(NextOrder()).DataSource(SourceType.Dictionary);
        }
    }

}