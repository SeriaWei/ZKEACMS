/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.ViewPort.jsTree;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.Service;
using System.Linq;

namespace ZKEACMS.Article.Controllers
{
    [DefaultAuthorize]
    public class ArticleTypeController : BasicController<ArticleType, int, IArticleTypeService>
    {
        public ArticleTypeController(IArticleTypeService service)
            : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewArticleType)]
        public override IActionResult Index()
        {
            return base.Index();
        }

        public override IActionResult Create()
        {
            var parentId = Request.Query["ParentID"];
            var articleType = new ArticleType { ParentID = 0 };
            if (parentId.Count > 0)
            {
                int id;
                if (int.TryParse(parentId.ToString(), out id))
                {
                    articleType.ParentID = id;
                }
            }
            return View(articleType);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticleType)]
        public override IActionResult Create(ArticleType entity)
        {
            return base.Create(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageArticleType)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticleType)]
        public override IActionResult Edit(ArticleType entity)
        {
            return base.Edit(entity);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewArticleType)]
        public JsonResult GetArticleTypeTree()
        {
            var allNodes = Service.Get().ToList();
            var node = new Tree<ArticleType>().Source(allNodes).ToNode(m => m.ID.ToString(), m => m.Title, m => m.ParentID.ToString(), "0");
            return Json(node);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticleType)]
        public override IActionResult Delete(int id)
        {
            return base.Delete(id);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewArticleType)]
        public IActionResult Select(int? selected)
        {
            ViewBag.Selected = selected;
            return View();
        }
    }
}
