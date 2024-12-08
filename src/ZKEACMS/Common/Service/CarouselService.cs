/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using ZKEACMS.Common.Models;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;

namespace ZKEACMS.Common.Service
{
    public class CarouselService : ServiceBase<CarouselEntity, CMSDbContext>, ICarouselService
    {
        private readonly ICarouselItemService _carouselItemService;

        public CarouselService(ICarouselItemService carouselItemService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _carouselItemService = carouselItemService;
        }

        public override DbSet<CarouselEntity> CurrentDbSet => DbContext.Carousel;

        public override CarouselEntity Get(params object[] primaryKey)
        {
            var carousel = base.Get(primaryKey);
            carousel.CarouselItems = _carouselItemService.Get(m => m.CarouselID == carousel.ID).ToList();
            return carousel;
        }

        public override ErrorOr<CarouselEntity> Add(CarouselEntity item)
        {
            var result = base.Add(item);
            if (result.HasError)
            {
                return result;
            }
            if (item.CarouselItems != null)
            {
                _carouselItemService.BeginBulkSave();
                item.CarouselItems.Each(m =>
                {
                    m.CarouselID = item.ID;
                    if (m.ActionType.HasFlag(ActionType.Create))
                    {
                        var itemResult = _carouselItemService.Add(m);
                        if (itemResult.HasError)
                        {
                            itemResult.Errors.Each(result.AddError);
                        }
                    }
                });
                _carouselItemService.EndBulkSave();
            }
            return result;
        }
        private void SaveCarouselItems(CarouselItemEntity item)
        {

            if (item.ActionType.HasFlag(ActionType.Create))
            {
                _carouselItemService.Add(item);
            }
            else if (item.ActionType.HasFlag(ActionType.Update))
            {
                _carouselItemService.Update(item);
            }
            else if (item.ActionType.HasFlag(ActionType.Delete))
            {
                if (item.ID > 0)
                {
                    _carouselItemService.Remove(item);
                }
            }

        }
        public override ErrorOr<CarouselEntity> Update(CarouselEntity item)
        {
            var result = base.Update(item);
            if (result.HasError)
            {
                return result;
            }
            if (item.CarouselItems != null)
            {
                _carouselItemService.BeginBulkSave();
                item.CarouselItems.Each(m =>
                {
                    m.CarouselID = item.ID;
                    SaveCarouselItems(m);
                });
                _carouselItemService.EndBulkSave();
            }
            return result;
        }
        public override ErrorOr<CarouselEntity> UpdateRange(params CarouselEntity[] items)
        {
            var result = base.UpdateRange(items);
            if (result.HasError)
            {
                return result;
            }
            items.Each(m =>
            {
                if (m.CarouselItems != null)
                {
                    _carouselItemService.BeginBulkSave();
                    m.CarouselItems.Each(carItem =>
                    {
                        carItem.CarouselID = m.ID;
                        SaveCarouselItems(carItem);
                    });
                    _carouselItemService.EndBulkSave();
                }
            });
            return result;
        }
        public override void Remove(CarouselEntity item)
        {
            if (item.CarouselItems != null)
            {
                _carouselItemService.BeginBulkSave();
                item.CarouselItems.Each(m => _carouselItemService.Remove(m));
                _carouselItemService.EndBulkSave();
            }
            base.Remove(item);
        }
    }
}