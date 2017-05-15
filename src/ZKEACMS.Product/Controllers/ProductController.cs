/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Easy.Constant;
using Easy.Extend;
using Easy.Mvc;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using ZKEACMS.Product.ActionFilter;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Product.Controllers
{
    [DefaultAuthorize, ViewDataProductCategory]
    public class ProductController : BasicController<ProductEntity, int, IProductService>
    {
        public ProductController(IProductService service)
            : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewProduct)]
        public override ActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override ActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override ActionResult Create(ProductEntity entity)
        {
            var result = base.Create(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID);
            }
            return result;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override ActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override ActionResult Edit(ProductEntity entity)
        {
            var result = base.Edit(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID);
                if (Request.Query["ReturnUrl"].Count > 0)
                {
                    return Redirect(Request.Query["ReturnUrl"]);
                }
            }
            return result;
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override JsonResult GetList(DataTableOption query)
        {
            return base.GetList(query);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override JsonResult Delete(int id)
        {
            return base.Delete(id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public IActionResult Sort()
        {
            return View(Service.GetAll());
        }
        [HttpPost]
        public JsonResult Sort([FromBody] IEnumerable<ProductEntity> products)
        {
            if (products != null && products.Any())
            {
                products.Each(m =>
                {
                    var product = Service.Get(m.ID);
                    if (product != null)
                    {
                        product.OrderIndex = m.OrderIndex;
                        Service.Update(product);
                    }
                });
            }
            return Json(new AjaxResult { Status = AjaxStatus.Normal });
        }
    }
}
