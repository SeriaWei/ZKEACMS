/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.AspNetCore.Mvc.Abstractions;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Internal;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace Easy.Mvc.Plugin
{
    public class ActionDescriptorProvider : IActionDescriptorProvider
    {
        private readonly IApplicationModelProvider[] _applicationModelProviders;
        private readonly IEnumerable<IApplicationModelConvention> _conventions;
        public static Dictionary<string, List<TypeInfo>> PluginControllers { get; } = new Dictionary<string, List<TypeInfo>>();
        public ActionDescriptorProvider(IEnumerable<IApplicationModelProvider> applicationModelProviders, IEnumerable<IApplicationModelConvention>
            conventions)
        {
            _applicationModelProviders = applicationModelProviders.OrderBy(p => p.Order).ToArray(); ;
            _conventions = conventions;
        }
        public int Order
        {
            get
            {
                return 0;
            }
        }

        public void OnProvidersExecuted(ActionDescriptorProviderContext context)
        {

        }

        public void OnProvidersExecuting(ActionDescriptorProviderContext context)
        {
            foreach (var descriptor in GetDescriptors())
            {
                context.Results.Add(descriptor);
            }
        }
        internal protected IEnumerable<ControllerActionDescriptor> GetDescriptors()
        {
            var applicationModel = BuildModel();
            ApplicationModelConventions.ApplyConventions(applicationModel, _conventions);
            return ControllerActionDescriptorBuilder.Build(applicationModel);
        }
        internal protected ApplicationModel BuildModel()
        {
            var controllerTypes = PluginControllers.SelectMany(m => m.Value);
            var context = new ApplicationModelProviderContext(controllerTypes);

            for (var i = 0; i < _applicationModelProviders.Length; i++)
            {
                _applicationModelProviders[i].OnProvidersExecuting(context);
            }

            for (var i = _applicationModelProviders.Length - 1; i >= 0; i--)
            {
                _applicationModelProviders[i].OnProvidersExecuted(context);
            }

            return context.Result;
        }
    }
}
