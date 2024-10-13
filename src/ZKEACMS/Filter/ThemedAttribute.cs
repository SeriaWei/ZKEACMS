/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc.Routing;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Page;
using ZKEACMS.Theme;

namespace ZKEACMS.Filter
{
    public class ThemedAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var pageContext = context.HttpContext.RequestServices.GetService<IPageContext>();
            var themeService = context.HttpContext.RequestServices.GetService<IThemeService>();
            var theme = themeService.GetCurrentTheme();
            if (theme == null) return;

            var urlHelper = (context.Controller as ControllerBase).Url;
            if (themeService.ApplicationContext.HostingEnvironment.IsDevelopment())
            {
                pageContext.StyleSheets.Add(urlHelper.Content(theme.UrlDebugger));
            }
            else
            {
                pageContext.StyleSheets.Add(urlHelper.Content(theme.Url));
            }
        }
    }
}
