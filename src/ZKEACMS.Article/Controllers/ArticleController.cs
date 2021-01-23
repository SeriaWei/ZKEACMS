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
using Easy.Extend;

namespace ZKEACMS.Article.Controllers
{
    [DefaultAuthorize, ViewDataArticleType]
    public class ArticleController : BasicController<ArticleEntity, int, IArticleService>
    {
        private readonly IAuthorizer _authorizer;
        public ArticleController(IArticleService service, IAuthorizer authorizer)
            : base(service)
        {
            _authorizer = authorizer;
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
        public override IActionResult Create(ArticleEntity entity)
        {
            if (entity.ActionType == ActionType.Publish && _authorizer.Authorize(PermissionKeys.PublishArticle))
            {
                Service.Publish(entity);
            }
            var result = base.Create(entity);
            return result;
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override IActionResult Edit(int Id)
        {
            return base.Edit(Id);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageArticle)]
        public override IActionResult Edit(ArticleEntity entity)
        {
            var result = base.Edit(entity);
            if (entity.ActionType == ActionType.Publish && _authorizer.Authorize(PermissionKeys.PublishArticle))
            {
                Service.Publish(entity);
            }
            if (Request.Query["ReturnUrl"].Count > 0)
            {
                return Redirect(Request.Query["ReturnUrl"]);
            }
            return result;
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
        [DefaultAuthorize(Policy = PermissionKeys.ViewArticle)]
        public IActionResult Select()
        {
            return View();
        }
    }
}
