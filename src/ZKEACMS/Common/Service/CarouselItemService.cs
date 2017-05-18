/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Common.Models;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy;
using Microsoft.EntityFrameworkCore;
using System;

namespace ZKEACMS.Common.Service
{
    public class CarouselItemService : ServiceBase<CarouselItemEntity, CMSDbContext>, ICarouselItemService
    {
        public CarouselItemService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override DbSet<CarouselItemEntity> CurrentDbSet
        {
            get
            {
                return DbContext.CarouselItem;
            }
        }

        public override void Add(CarouselItemEntity item)
        {
            if (item.ActionType != ActionType.Unattached)
            {
                base.Add(item);
            }
        }
        public override void Update(CarouselItemEntity item, bool saveImmediately = true)
        {
            if (item.ActionType == ActionType.Update)
            {
                base.Update(item, saveImmediately);
            }
            else if (item.ActionType == ActionType.Create)
            {
                base.Add(item);
            }
            else if (item.ActionType == ActionType.Delete)
            {
                Remove(item, saveImmediately);
            }
        }

        public override void UpdateRange(params CarouselItemEntity[] items)
        {
            items.Each(m => Update(m));
        }
    }
}