using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS
{
    public static class ActionContextExtend
    {
        public static void NotFoundResult(this ActionContext actionContext)
        {
            var executedContext = actionContext as ActionExecutedContext;
            if (executedContext != null && executedContext.Result is ViewResult)
            {
                var viewResult = executedContext.Result as ViewResult;
                viewResult.StatusCode = 404;
                viewResult.ViewName = "NotFound";
            }
        }
    }
}
