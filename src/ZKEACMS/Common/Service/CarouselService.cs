/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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
    public class CarouselService : ServiceBase<CarouselEntity>, ICarouselService
    {
        private readonly ICarouselItemService _carouselItemService;



        public CarouselService(ICarouselItemService carouselItemService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(applicationContext, dbContext)
        {
            _carouselItemService = carouselItemService;
        }
        public override DbSet<CarouselEntity> CurrentDbSet
        {
            get
            {
                return (DbContext as CMSDbContext).Carousel;
            }
        }
        public override CarouselEntity Get(params object[] primaryKey)
        {
            var carousel = base.Get(primaryKey);
            carousel.CarouselItems = _carouselItemService.Get(m => m.CarouselID == carousel.ID).ToList();
            return carousel;
        }

        public override void Add(CarouselEntity item)
        {
            base.Add(item);
            if (item.CarouselItems != null)
            {
                item.CarouselItems.Each(m =>
                {
                    m.CarouselID = item.ID;
                    if (m.ActionType == ActionType.Create)
                    {
                        _carouselItemService.Add(m);
                    }
                });
            }
        }
        private void SaveCarouselItems(CarouselItemEntity item)
        {
            switch (item.ActionType)
            {
                case ActionType.Create:
                    {
                        _carouselItemService.Add(item);
                        break;
                    }
                case ActionType.Update:
                    {
                        _carouselItemService.Update(item);
                        break;
                    }
                case ActionType.Delete:
                    {
                        _carouselItemService.Remove(item);
                        break;
                    }
            }
        }
        public override void Update(CarouselEntity item, bool saveImmediately = true)
        {
            base.Update(item, saveImmediately);
            if (item.CarouselItems != null)
            {
                item.CarouselItems.Each(m =>
                {
                    m.CarouselID = item.ID;
                    SaveCarouselItems(m);
                });
            }
        }
        public override void UpdateRange(params CarouselEntity[] items)
        {
            base.UpdateRange(items);
            items.Each(m =>
            {
                if (m.CarouselItems != null)
                {
                    m.CarouselItems.Each(carItem =>
                    {
                        carItem.CarouselID = m.ID;
                        SaveCarouselItems(carItem);
                    });

                }
            });
        }
        public override void Remove(CarouselEntity item, bool saveImmediately = true)
        {
            if (item.CarouselItems != null)
            {
                item.CarouselItems.Each(m => _carouselItemService.Remove(m));
            }            
            base.Remove(item, saveImmediately);
        }
    }
}