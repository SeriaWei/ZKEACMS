/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Easy.Constant;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Product.Controllers
{
    [DefaultAuthorize]
    public class ProductController : BasicController<ProductEntity, long, IProductService>
    {
        public ProductController(IProductService service)
            : base(service)
        {
        }
        [HttpPost]
        public override ActionResult Create(ProductEntity entity)
        {
            var result = base.Create(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID ?? 0);
            }
            return result;
        }

        [HttpPost]
        public override ActionResult Edit(ProductEntity entity)
        {
            var result = base.Edit(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID ?? 0);
            }
            return result;
        }
    }
}
