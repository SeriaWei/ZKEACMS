/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.SSE
{
    public class ServerSendEventAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            if (context.HttpContext.Request.Headers["Accept"] != "text/event-stream")
            {
                context.Result = new BadRequestResult();
                return;
            }

            context.HttpContext.Response.Headers["Content-Type"] = "text/event-stream";
            context.HttpContext.Response.Headers["Cache-Control"] = "no-cache";
            context.HttpContext.Response.Headers["Connection"] = "keep-alive";
            base.OnActionExecuting(context);
        }
    }
}
