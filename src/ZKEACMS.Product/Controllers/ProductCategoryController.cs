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
    public class ProductCategoryController : BasicController<ProductCategory, long, IProductCategoryService>
    {
        public ProductCategoryController(IProductCategoryService service)
            : base(service)
        {
        }

        public override ActionResult Create()
        {

            var parentId = Request.Query["ParentID"];
            var productCategory = new ProductCategory { ParentID = 0 };
            if (parentId.Count > 0)
            {
                long id;
                if (long.TryParse(parentId.ToString(), out id))
                {
                    productCategory.ParentID = id;
                }
            }
            return View(productCategory);
        }

        public JsonResult GetProductCategoryTree()
        {
            var pages = Service.GetAll();
            var node = new Tree<ProductCategory>().Source(pages).ToNode(m => m.ID.ToString(), m => m.Title, m => m.ParentID.ToString(), "0");
            return Json(node);
        }
    }
}
