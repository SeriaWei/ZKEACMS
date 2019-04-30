using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc;
using Easy.Mvc.Extend;

namespace ZKEACMS.Shop.Filter
{
    public class CustomLoginCheckAttribute : ActionFilterAttribute, IActionFilter
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.RequestServices.GetService<IApplicationContextAccessor>().Current.CurrentCustomer == null)
            {
                var location = (context.Controller as Controller).Url.Action("SignIn", "Account", new { ReturnUrl = context.HttpContext.Request.GetReferer() });
                context.Result = new JsonResult(new AjaxResult { Location = location, Status = AjaxStatus.Redirect });
            }
            else
            {
                base.OnActionExecuting(context);
            }
        }
    }
}
