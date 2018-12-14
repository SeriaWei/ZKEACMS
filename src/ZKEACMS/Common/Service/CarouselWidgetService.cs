/* http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class CarouselWidgetService : WidgetService<CarouselWidget>
    {
        private readonly ICarouselItemService _carouselItemService;


        public CarouselWidgetService(IWidgetBasePartService widgetService, ICarouselItemService carouselItemService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetService, applicationContext, dbContext)
        {
            _carouselItemService = carouselItemService;
        }

        public override DbSet<CarouselWidget> CurrentDbSet => (DbContext as CMSDbContext).CarouselWidget;

        public override WidgetBase GetWidget(WidgetBase widget)
        {
            var carouselWidget = base.GetWidget(widget) as CarouselWidget;

            carouselWidget.CarouselItems = _carouselItemService.Get(m => m.CarouselWidgetID == carouselWidget.ID);
            carouselWidget.CarouselItems.Each(m => m.ActionType = ActionType.Update);
            return carouselWidget;
        }

        public override void AddWidget(WidgetBase widget)
        {
            base.AddWidget(widget);
            var item = widget as CarouselWidget;
            if (item.CarouselItems != null && item.CarouselItems.Any())
            {
                _carouselItemService.BeginBulkSave();
                item.CarouselItems.Each(m =>
                {
                    if (m.ActionType != ActionType.Delete)
                    {
                        _carouselItemService.Add(new CarouselItemEntity
                        {
                            CarouselID = m.CarouselID,
                            Title = m.Title,
                            CarouselWidgetID = item.ID,
                            TargetLink = m.TargetLink,
                            ImageUrl = m.ImageUrl,
                            Status = m.Status
                        });
                    }
                });
                _carouselItemService.SaveChanges();
            }

        }
        public override void UpdateWidget(WidgetBase widget)
        {
            base.UpdateWidget(widget);
            var item = widget as CarouselWidget;
            if (item.CarouselItems != null && item.CarouselItems.Any())
            {
                _carouselItemService.BeginBulkSave();
                item.CarouselItems.Each(m =>
                {
                    m.CarouselWidgetID = item.ID;
                    if (m.ActionType == ActionType.Create)
                    {
                        _carouselItemService.Add(m);
                    }
                    else if (m.ActionType == ActionType.Delete)
                    {
                        if (m.ID > 0)
                        {
                            _carouselItemService.Remove(m);
                        }                        
                    }
                    else
                    {
                        _carouselItemService.Update(m);
                    }
                });
                _carouselItemService.SaveChanges();
            }
        }


        public override void DeleteWidget(string widgetId)
        {
            _carouselItemService.Remove(m => m.CarouselWidgetID == widgetId);
            base.DeleteWidget(widgetId);
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            var carouselWidget = widget as CarouselWidget;
            if (carouselWidget.CarouselID.HasValue)
            {
                carouselWidget.CarouselItems = _carouselItemService.Get(m => m.CarouselID == carouselWidget.CarouselID);
            }
            carouselWidget.CarouselItems = carouselWidget.CarouselItems.Where(m => m.Status == (int)RecordStatus.Active);
            return base.Display(widget, actionContext);
        }
    }
}