/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */

using Easy;
using Easy.Mvc.Attribute;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.DependencyInjection;

namespace ZKEACMS.Layout
{
    public class ViewDataLayoutsAttribute : Easy.Mvc.Attribute.ViewDataAttribute
    {
        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            (filterContext.Controller as Controller).ViewData[ViewDataKeys.Layouts] = 
                new SelectList(filterContext.HttpContext.RequestServices.GetService<ILayoutService>().Get(), "ID", "LayoutName");
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

        }
    }
}
