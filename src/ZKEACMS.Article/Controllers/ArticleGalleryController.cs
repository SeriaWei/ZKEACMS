using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.Service;

namespace ZKEACMS.Article.Controllers
{
    [DefaultAuthorize]
    public class ArticleGalleryController : BasicController<ArticleGallery, int, IArticleGalleryService>
    {
        public ArticleGalleryController(IArticleGalleryService service) : base(service)
        {
        }

        [DefaultAuthorize(Policy = PermissionKeys.ViewArticle)]
        public override IActionResult Index()
        {
            return base.Index();
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override IActionResult Create()
        {
            return base.Create();
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override IActionResult Create(ArticleGallery entity)
        {
            return base.Create(entity);
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override IActionResult Edit(ArticleGallery entity)
        {
            return base.Edit(entity);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ViewArticle)]
        public override IActionResult GetList(DataTableOption query)
        {
            return base.GetList(query);
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
    }
}
