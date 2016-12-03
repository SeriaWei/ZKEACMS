/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
/*!
 * http://www.zkea.net/
 * Copyright 2016 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using System.Web.Mvc;
using Easy.Constant;
using Easy.Web.Attribute;
using Easy.Web.Authorize;
using Easy.Web.CMS.Article.Models;
using Easy.Web.CMS.Article.Service;
using Easy.Web.Controller;

namespace ZKEACMS.Article.Controllers
{
    [AdminTheme, DefaultAuthorize]
    public class ArticleController : BasicController<ArticleEntity, long, IArticleService>
    {
        public ArticleController(IArticleService service)
            : base(service)
        {
        }
        [HttpPost]
        public override ActionResult Create(ArticleEntity entity)
        {
            var result = base.Create(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID);
            }
            return result;
        }
        [HttpPost]
        public override ActionResult Edit(ArticleEntity entity)
        {
            var result = base.Edit(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID);
            }
            return result;
        }
      
    }
}
