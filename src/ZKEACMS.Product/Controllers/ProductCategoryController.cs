/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */


using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;
using System.Linq;

namespace ZKEACMS.Product.Controllers
{
    [DefaultAuthorize]
    public class ProductCategoryController : BasicController<ProductCategory, int, IProductCategoryService>
    {
        public ProductCategoryController(IProductCategoryService service)
            : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewProductCategory)]
        public override IActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override IActionResult Create()
        {

            var parentId = Request.Query["ParentID"];
            var productCategory = new ProductCategory { ParentID = 0 };
            if (parentId.Count > 0)
            {
                int id;
                if (int.TryParse(parentId.ToString(), out id))
                {
                    productCategory.ParentID = id;
                }
            }
            return View(productCategory);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override IActionResult Create(ProductCategory entity)
        {
            return base.Create(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override IActionResult Edit(ProductCategory entity)
        {
            return base.Edit(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewProductCategory)]
        public JsonResult GetProductCategoryTree()
        {
            var pages = Service.Get().ToList();
            var node = new Tree<ProductCategory>().Source(pages).ToNode(m => m.ID.ToString(), m => m.Title, m => m.ParentID.ToString(), "0");
            return Json(node);
        }

        [DefaultAuthorize(Policy = PermissionKeys.ViewProductCategory)]
        public IActionResult Select(int? selected)
        {
            ViewBag.Selected = selected;
            return View();
        }
    }
}
