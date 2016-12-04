/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Common.Models;
using Easy.Constant;
using Easy.Extend;
using Easy.RepositoryPattern;
using Easy;

namespace ZKEACMS.Common.Service
{
    public class CarouselItemService : ServiceBase<CarouselItemEntity>, ICarouselItemService
    {
        public CarouselItemService(IApplicationContext applicationContext) : base(applicationContext)
        {
        }

        public override void Add(CarouselItemEntity item)
        {
            if (item.ActionType != ActionType.Unattached)
            {
                base.Add(item);
            }
        }
        public override void Update(CarouselItemEntity item)
        {
            if (item.ActionType == ActionType.Update)
            {
                base.Update(item);
            }
            else if (item.ActionType == ActionType.Create)
            {
                base.Add(item);
            }
            else if (item.ActionType == ActionType.Delete)
            {
                Remove(item);
            }
        }

        public override void UpdateRange(params CarouselItemEntity[] items)
        {
            items.Each(m => Update(m));
        }
    }
}