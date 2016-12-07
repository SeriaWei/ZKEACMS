/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Common.Models;
using Easy.Constant;
using Easy.Extend;
using ZKEACMS.Widget;
using Microsoft.AspNetCore.Http;
using Easy;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Common.Service
{
    public class CarouselWidgetService : WidgetService<CarouselWidget, CMSDbContext>
    {
        private readonly ICarouselItemService _carouselItemService;

        public override DbSet<CarouselWidget> CurrentDbSet
        {
            get
            {
                return DbContext.CarouselWidget;
            }
        }

        public CarouselWidgetService(IWidgetBasePartService widgetService, ICarouselItemService carouselItemService, IApplicationContext applicationContext)
            : base(widgetService, applicationContext)
        {
            _carouselItemService = carouselItemService;
        }

        public override WidgetBase GetWidget(WidgetBase widget)
        {
            var carouselWidget = base.GetWidget(widget) as CarouselWidget;

            carouselWidget.CarouselItems = _carouselItemService.Get(m => m.CarouselWidgetID == carouselWidget.ID).ToList();
            carouselWidget.CarouselItems.Each(m => m.ActionType = ActionType.Update);
            return carouselWidget;
        }

        public override void AddWidget(WidgetBase widget)
        {
            base.AddWidget(widget);
            var item = widget as CarouselWidget;
            if (item.CarouselItems != null && item.CarouselItems.Any())
            {
                item.CarouselItems.Each(m =>
                {
                    m.CarouselWidgetID = item.ID;
                    _carouselItemService.Add(m);
                });
            }

        }
        public override void UpdateWidget(WidgetBase widget)
        {
            base.UpdateWidget(widget);
            var item = widget as CarouselWidget;
            if (item.CarouselItems != null && item.CarouselItems.Any())
            {
                item.CarouselItems.Each(m =>
                {
                    m.CarouselWidgetID = item.ID;
                    _carouselItemService.Add(m);
                });
            }
        }


        public override void DeleteWidget(string widgetId)
        {
            _carouselItemService.Remove(m => m.CarouselWidgetID == widgetId);
            base.DeleteWidget(widgetId);
        }

        public override WidgetViewModelPart Display(WidgetBase widget, HttpContext httpContext)
        {
            var carouselWidget = widget as CarouselWidget;
            if (carouselWidget.CarouselID.HasValue)
            {
                var varouselItems = _carouselItemService.Get(m => m.CarouselID == carouselWidget.CarouselID).ToList();
                if (carouselWidget.CarouselItems == null)
                {
                    carouselWidget.CarouselItems = varouselItems;
                }
                else
                {
                    ((List<CarouselItemEntity>)carouselWidget.CarouselItems).AddRange(varouselItems);
                }
            }
            carouselWidget.CarouselItems =
                carouselWidget.CarouselItems.Where(m => m.Status == (int)RecordStatus.Active);
            return base.Display(widget, httpContext);
        }
    }
}