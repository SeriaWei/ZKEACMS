/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy.Mvc.Attribute;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;
using System.Linq;
using ZKEACMS.Product.Service;

namespace ZKEACMS.Product.ActionFilter
{
    public class ViewDataProductCategoryAttribute : Easy.Mvc.Attribute.ViewDataAttribute
    {

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {

        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var productCategoryService = filterContext.HttpContext.RequestServices.GetService<IProductCategoryService>();
            (filterContext.Controller as Controller) .ViewData[ViewDataKeys.ProductCategory] = 
                new SelectList(productCategoryService.Get().ToList(), "ID", "Title");
        }
    }
}