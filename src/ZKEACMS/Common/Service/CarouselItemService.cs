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
    public class CarouselItemService : ServiceBase<CarouselItemEntity>, ICarouselItemService
    {
        public CarouselItemService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }
        public override DbSet<CarouselItemEntity> CurrentDbSet => (DbContext as CMSDbContext).CarouselItem;

        public override ServiceResult<CarouselItemEntity> Add(CarouselItemEntity item)
        {
            if (item.ActionType != ActionType.Unattached)
            {
                return base.Add(item);
            }
            return new ServiceResult<CarouselItemEntity>();
        }
        public override ServiceResult<CarouselItemEntity> Update(CarouselItemEntity item)
        {
            if (item.ActionType == ActionType.Update)
            {
                return base.Update(item);
            }
            else if (item.ActionType == ActionType.Create)
            {
                return base.Add(item);
            }
            else if (item.ActionType == ActionType.Delete)
            {
                if (item.ID > 0)
                {
                    Remove(item);
                }                
            }
            return new ServiceResult<CarouselItemEntity>();
        }

        public override ServiceResult<CarouselItemEntity> UpdateRange(params CarouselItemEntity[] items)
        {
            items.Each(m => Update(m));
            return new ServiceResult<CarouselItemEntity>();
        }
    }
}