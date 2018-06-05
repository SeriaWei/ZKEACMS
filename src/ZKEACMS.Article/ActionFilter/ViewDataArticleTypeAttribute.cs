/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.Attribute;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using ZKEACMS.Article.Service;
using Microsoft.Extensions.DependencyInjection;
using System.Linq;

namespace ZKEACMS.Article.ActionFilter
{
    public class ViewDataArticleTypeAttribute : Easy.Mvc.Attribute.ViewDataAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {

        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var types = filterContext.HttpContext.RequestServices.GetService<IArticleTypeService>().Get().ToList();
            (filterContext.Controller as Controller)
                .ViewData[ViewDataKeys.ArticleCategory] = new SelectList(types, "ID", "Title");
        }
    }
}