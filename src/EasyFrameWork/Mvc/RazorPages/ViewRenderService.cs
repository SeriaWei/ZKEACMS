/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Easy.Mvc.Plugin;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.Hosting;
using System;
using System.IO;

namespace Easy.Mvc.RazorPages
{
    public class ViewRenderService : IViewRenderService
    {
        private readonly IRazorViewEngine _viewEngine;
        private readonly ITempDataProvider _tempDataProvider;
        private readonly IWebHostEnvironment _hostingEnvironment;
        private readonly IHttpContextAccessor _httpContextAccessor;

        public ViewRenderService(IRazorViewEngine viewEngine, ITempDataProvider tempDataProvider, IWebHostEnvironment hostingEnvironment, IHttpContextAccessor httpContextAccessor)
        {
            _viewEngine = viewEngine;
            _tempDataProvider = tempDataProvider;
            _hostingEnvironment = hostingEnvironment;
            _httpContextAccessor = httpContextAccessor;
        }
        public string Render(string viewPath)
        {
            return Render(viewPath, string.Empty);
        }
        public string Render<TModel>(string viewPath, TModel model)
        {
            ActionContext actionContext = new ActionContext(_httpContextAccessor.HttpContext, new RouteData(), new ActionDescriptor());

            string pluginPath = $"~/wwwroot/{Loader.PluginFolder}/";
            string actualViewPath = viewPath;
            if (_hostingEnvironment.IsDevelopment() && actualViewPath.StartsWith(pluginPath))
            {
                actualViewPath = actualViewPath.Replace(pluginPath, DeveloperViewFileProvider.ProjectRootPath);
            }

            ViewEngineResult viewResult = _viewEngine.GetView(null, actualViewPath, true);

            if (!viewResult.Success)
            {
                throw new InvalidOperationException($"Can not find view from path: {viewPath}. If your view is in plugins, please make sure the path is starts with ~/wwwroot/{Loader.PluginFolder}/");
            }

            ViewDataDictionary viewDictionary = new ViewDataDictionary(new EmptyModelMetadataProvider(), new ModelStateDictionary())
            {
                Model = model
            };

            using (StringWriter writer = new StringWriter())
            {
                ViewContext viewContext = new ViewContext(
                     actionContext,
                     viewResult.View,
                     viewDictionary,
                     new TempDataDictionary(actionContext.HttpContext, _tempDataProvider),
                     writer,
                     new HtmlHelperOptions()
                 );

                System.Threading.Tasks.Task render = viewResult.View.RenderAsync(viewContext);
                render.Wait();
                return writer.ToString();
            }
        }
    }
}
