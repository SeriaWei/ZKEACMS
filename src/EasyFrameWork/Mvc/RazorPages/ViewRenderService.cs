using Easy.Mvc.Plugin;
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
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Easy.Mvc.RazorPages
{
    public class ViewRenderService : IViewRenderService
    {
        private readonly IRazorViewEngine _viewEngine;
        private readonly ITempDataProvider _tempDataProvider;
        private readonly IServiceProvider _serviceProvider;
        private readonly IHostingEnvironment _hostingEnvironment;

        public ViewRenderService(IRazorViewEngine viewEngine, ITempDataProvider tempDataProvider,
            IServiceProvider serviceProvider, IHostingEnvironment hostingEnvironment)
        {
            _viewEngine = viewEngine;
            _tempDataProvider = tempDataProvider;
            _serviceProvider = serviceProvider;
            _hostingEnvironment = hostingEnvironment;
        }
        public string Render(string viewPath)
        {
            return Render(viewPath, string.Empty);
        }
        public string Render<TModel>(string viewPath, TModel model)
        {
            var httpContext = new DefaultHttpContext { RequestServices = _serviceProvider };
            var actionContext = new ActionContext(httpContext, new RouteData(), new ActionDescriptor());

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

            var viewDictionary = new ViewDataDictionary(new EmptyModelMetadataProvider(), new ModelStateDictionary())
            {
                Model = model
            };

            using (var writer = new StringWriter())
            {
                var viewContext = new ViewContext(
                     actionContext,
                     viewResult.View,
                     viewDictionary,
                     new TempDataDictionary(actionContext.HttpContext, _tempDataProvider),
                     writer,
                     new HtmlHelperOptions()
                 );
                var render = viewResult.View.RenderAsync(viewContext);
                render.Wait();
                return writer.ToString();
            }
        }
    }
}
