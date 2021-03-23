using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Product.Models;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Product.Controllers
{
    [DefaultAuthorize]
    public class ProductGalleryController : BasicController<ProductGallery, int, IProductGalleryService>
    {
        public ProductGalleryController(IProductGalleryService service) : base(service)
        {
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
        public override IActionResult Create(ProductGallery entity)
        {
            return base.Create(entity);
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Edit(ProductGallery entity)
        {
            return base.Edit(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ViewProduct)]
        public override IActionResult GetList(DataTableOption query)
        {
            return base.GetList(query);
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManageProduct)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
