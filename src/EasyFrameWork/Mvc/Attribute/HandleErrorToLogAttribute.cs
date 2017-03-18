/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.Attribute
{
    public class HandleErrorToLogAttribute : ExceptionFilterAttribute
    {
        public override void OnException(ExceptionContext filterContext)
        {
            base.OnException(filterContext);
            filterContext.HttpContext.RequestServices.GetService<ILogger>().Error(filterContext.Exception);
        }
    }
}