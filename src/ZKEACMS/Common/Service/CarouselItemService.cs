/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
        public CarouselItemService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        public override DbSet<CarouselItemEntity> CurrentDbSet => DbContext.CarouselItem;

        public override ErrorOr<CarouselItemEntity> Add(CarouselItemEntity item)
        {
            if (!item.ActionType.HasFlag(ActionType.UnAttach))
            {
                return base.Add(item);
            }
            return new ErrorOr<CarouselItemEntity>();
        }
        public override ErrorOr<CarouselItemEntity> Update(CarouselItemEntity item)
        {
            if (item.ActionType.HasFlag(ActionType.Update))
            {
                return base.Update(item);
            }
            else if (item.ActionType.HasFlag(ActionType.Create))
            {
                return base.Add(item);
            }
            else if (item.ActionType.HasFlag(ActionType.Delete))
            {
                if (item.ID > 0)
                {
                    Remove(item);
                }
            }
            return new ErrorOr<CarouselItemEntity>();
        }

        public override ErrorOr<CarouselItemEntity> UpdateRange(params CarouselItemEntity[] items)
        {
            items.Each(m => Update(m));
            return new ErrorOr<CarouselItemEntity>();
        }
    }
}