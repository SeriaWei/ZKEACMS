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
    [DefaultAuthorize]
    public class ProductCategoryController : BasicController<ProductCategory, int, IProductCategoryService>
    {
        public ProductCategoryController(IProductCategoryService service)
            : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewProductCategory)]
        public override ActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override ActionResult Create()
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
        public override ActionResult Create(ProductCategory entity)
        {
            return base.Create(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override ActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override ActionResult Edit(ProductCategory entity)
        {
            return base.Edit(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProductCategory)]
        public override JsonResult Delete(string ids)
        {
            return base.Delete(ids);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewProductCategory)]
        public JsonResult GetProductCategoryTree()
        {
            var pages = Service.GetAll();
            var node = new Tree<ProductCategory>().Source(pages).ToNode(m => m.ID.ToString(), m => m.Title, m => m.ParentID.ToString(), "0");
            return Json(node);
        }
    }
}
