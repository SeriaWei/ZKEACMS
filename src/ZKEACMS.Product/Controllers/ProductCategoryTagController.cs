/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;
using Easy.Extend;

namespace ZKEACMS.Product.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewProductCategoryTag)]
    public class ProductCategoryTagController : BasicController<ProductCategoryTag, int, IProductCategoryTagService>
    {
        public ProductCategoryTagController(IProductCategoryTagService service)
            : base(service)
        {
        }

        public override IActionResult Index()
        {
            return base.Index();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategoryTag)]
        public override IActionResult Create(ProductCategoryTag entity)
        {
            Service.Add(entity);
            return Json(new { entity.ID });
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategoryTag)]
        public override IActionResult Edit(ProductCategoryTag entity)
        {
            Service.Update(entity);
            return Json(new { entity.ID });
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategoryTag)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [HttpPost]
        public IActionResult GetTags(int ProductCategoryId)
        {
            ViewBag.ProductCategoryId = ProductCategoryId;
            return View("Tags", Service.Get(m => m.ProductCategoryId == ProductCategoryId));
        }
    }
}
