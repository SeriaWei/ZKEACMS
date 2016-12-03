/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Web.Mvc;
using Easy.ViewPort.jsTree;
using Easy.Web.Attribute;
using Easy.Web.Authorize;
using Easy.Web.CMS.Article.Models;
using Easy.Web.CMS.Article.Service;
using Easy.Web.Controller;

namespace ZKEACMS.Article.Controllers
{
    [AdminTheme, DefaultAuthorize]
    public class ArticleTypeController : BasicController<ArticleType, long, IArticleTypeService>
    {
        public ArticleTypeController(IArticleTypeService service)
            : base(service)
        {
        }

        public override ActionResult Create()
        {
            var parentId = ValueProvider.GetValue("ParentID");
            var articleType = new ArticleType { ParentID = 0 };
            if (parentId != null)
            {
                long id;
                if (long.TryParse(parentId.AttemptedValue, out id))
                {
                    articleType.ParentID = id;
                }
            }
            return View(articleType);
        }

        public JsonResult GetArticleTypeTree()
        {
            var allNodes = Service.Get();
            var node = new Tree<ArticleType>().Source(allNodes).ToNode(m => m.ID.ToString(), m => m.Title, m => m.ParentID.ToString(), "0");
            return Json(node, JsonRequestBehavior.AllowGet);
        }
    }
}
