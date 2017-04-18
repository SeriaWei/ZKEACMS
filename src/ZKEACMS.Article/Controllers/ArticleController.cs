/*!
 * http://www.zkea.net/
 * Copyright 2017 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy.Constant;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Article.ActionFilter;
using ZKEACMS.Article.Models;
using ZKEACMS.Article.Service;

namespace ZKEACMS.Article.Controllers
{
    [DefaultAuthorize, ViewDataArticleType]
    public class ArticleController : BasicController<ArticleEntity, int, IArticleService>
    {
        public ArticleController(IArticleService service)
            : base(service)
        {
        }
        [DefaultAuthorize(Policy = PermissionKeys.ViewArticle)]
        public override ActionResult Index()
        {
            return base.Index();
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override ActionResult Create()
        {
            return base.Create();
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override ActionResult Create(ArticleEntity entity)
        {
            var result = base.Create(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID);
            }
            return result;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override ActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override ActionResult Edit(ArticleEntity entity)
        {
            var result = base.Edit(entity);
            if (entity.ActionType == ActionType.Publish)
            {
                Service.Publish(entity.ID);
            }
            return result;
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ViewArticle)]
        public override JsonResult GetList(DataTableOption query)
        {
            return base.GetList(query);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override JsonResult Delete(string ids)
        {
            return base.Delete(ids);
        }
    }
}
