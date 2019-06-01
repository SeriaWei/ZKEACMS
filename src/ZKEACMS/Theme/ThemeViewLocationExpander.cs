using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.AspNetCore.Mvc.Razor.Internal;

namespace ZKEACMS.Theme
{
    public class ThemeViewLocationExpander : IViewLocationExpander
    {
        private readonly string viewExtension = RazorViewEngine.ViewExtension;
        private readonly string wwwroot = "wwwroot";
        public ThemeViewLocationExpander()
        {
            
        }

        public void PopulateValues([FromServices]ViewLocationExpanderContext context)
        {
            var service = context.ActionContext.HttpContext.RequestServices.GetService<IThemeService>();
            var theme = service.GetCurrentTheme();
            if (theme != null)
            {
                context.Values["theme"] = theme.ID;
            }
            
        }

        /// <summary>
        /// 主题切换
        /// </summary>
        /// <param name="theme"></param>
        /// <returns></returns>
        public virtual IEnumerable<string> ExpandViewLocations(ViewLocationExpanderContext context, IEnumerable<string> viewLocations)
        {
            context.Values.TryGetValue("theme", out string theme);
            if (!string.IsNullOrEmpty(theme))
            {
                yield return $"/{wwwroot}/themes/{theme}/Views/{{1}}/{{0}}{viewExtension}";
                yield return $"/{wwwroot}/themes/{theme}/Views/{{0}}{viewExtension}";
                yield return $"/{wwwroot}/themes/{theme}/Views/Shared/{{0}}{viewExtension}";
            }
            foreach (string item in viewLocations)
            {
                yield return item;
            }
        }
    }
}
