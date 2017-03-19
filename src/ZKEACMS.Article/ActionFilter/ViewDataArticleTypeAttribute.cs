/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.Attribute;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using ZKEACMS.Article.Service;

namespace ZKEACMS.Article.ActionFilter
{
    public class ViewDataArticleTypeAttribute : ViewDataAttribute
    {
        private IArticleTypeService _articleTypeService;

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {

        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            _articleTypeService = _articleTypeService ?? ServiceLocator.GetService<IArticleTypeService>();
            (filterContext.Controller as Controller)
                .ViewData[ViewDataKeys.ArticleCategory] = new SelectList(_articleTypeService.GetAll(), "ID", "Title");
        }
    }
}