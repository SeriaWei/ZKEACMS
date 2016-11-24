/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using ZKEACMS.Common.Models;
using ZKEACMS.Common.Service;
using Easy.Mvc.Attribute;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class CarouselController : BasicController<CarouselEntity, int, ICarouselService>
    {
        public CarouselController(ICarouselService service)
            : base(service)
        {

        }
    }
}
