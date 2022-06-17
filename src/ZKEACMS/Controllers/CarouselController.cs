/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewCarousel)]
    public class CarouselController : BasicController<CarouselEntity, int, ICarouselService>
    {
        public CarouselController(ICarouselService service)
            : base(service)
        {

        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageCarousel)]
        public override IActionResult Create(CarouselEntity entity)
        {
            return base.Create(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageCarousel)]
        public override IActionResult Edit(CarouselEntity entity)
        {
            return base.Edit(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageCarousel)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
