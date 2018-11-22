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
using Microsoft.Extensions.DependencyInjection;
using ZKEACMS.Product.ViewModel;

namespace ZKEACMS.Product.Controllers
{
    [DefaultAuthorize, ViewDataProductCategory]
    public class ProductController : BasicController<ProductEntity, int, IProductService>
    {
        private readonly IProductCategoryService _productCategoryService;
        private readonly IProductCategoryTagService _productCategoryTagService;
        private readonly IAuthorizer _authorizer;
        public ProductController(IProductService service, IProductCategoryService productCategoryService, IAuthorizer authorizer, IProductCategoryTagService productCategoryTagService)
            : base(service)
        {
            _productCategoryService = productCategoryService;
            _productCategoryTagService = productCategoryTagService;
            _authorizer = authorizer;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewProduct)]
        public override IActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Create(ProductEntity entity)
        {
            var result = base.Create(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID);
            }
            return result;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Edit(ProductEntity entity)
        {
            var result = base.Edit(entity);
            if (entity.ActionType == ActionType.Publish && _authorizer.Authorize(PermissionKeys.PublishProduct))
            {
                Service.Publish(entity.ID);
            }
            if (Request.Query["ReturnUrl"].Count > 0)
            {
                return Redirect(Request.Query["ReturnUrl"]);
            }
            return result;
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult GetList(DataTableOption query)
        {
            return base.GetList(query);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public IActionResult Sort()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Sort([FromBody] IEnumerable<ProductEntity> products)
        {
            if (products != null && products.Any())
            {
                Service.BeginBulkSave();
                products.Each(m =>
                {
                    var product = Service.Get(m.ID);
                    if (product != null)
                    {
                        product.OrderIndex = m.OrderIndex;
                        Service.Update(product);
                    }
                });
                Service.SaveChanges();
            }
            return Json(new AjaxResult { Status = AjaxStatus.Normal });
        }
        public JsonResult GetProducts(int ProductCategoryID)
        {
            var ids = _productCategoryService.Get(m => m.ParentID == ProductCategoryID || m.ID == ProductCategoryID).Select(m => m.ID);
            return Json(Service.Get(m => ids.Contains(m.ProductCategoryID))
                .OrderBy(m => m.OrderIndex)
                .ThenByDescending(m => m.ID).Select(m => new { m.ID, m.Title }));
        }
        [HttpPost]
        public IActionResult ProduceTags(int productId, int ProductCategoryId)
        {
            var tags = _productCategoryTagService.Get(m => m.ProductCategoryId == ProductCategoryId);
            if (productId != 0)
            {
                var productTags = HttpContext.RequestServices.GetService<IProductTagService>().Get(m => m.ProductId == productId);
                foreach (var item in tags)
                {
                    item.Selected = productTags.Any(m => m.TagId == item.ID);
                }
            }
            return View(new ProductTagViewModel { ProductTags = tags });
        }
    }
}
