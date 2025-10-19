//2.1 is different: https://github.com/aspnet/Mvc/blob/dev/src/Microsoft.AspNetCore.Mvc.Razor/Compilation/ViewsFeatureProvider.cs

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.ApplicationParts;
using Microsoft.AspNetCore.Mvc.Razor.Compilation;
using Microsoft.AspNetCore.Mvc.Razor.Internal;
using Microsoft.AspNetCore.Razor.Hosting;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Primitives;

namespace Easy.Mvc.Plugin
{
    public class PluginViewsFeatureProvider : IApplicationFeatureProvider<ViewsFeature>
    {
        public static readonly string PrecompiledViewsAssemblySuffix = ".PrecompiledViews";

        public static readonly IReadOnlyList<string> ViewAssemblySuffixes = new string[]
        {
            PrecompiledViewsAssemblySuffix,
            ".Views",
        };
        public IPluginLoader PluginLoader { get; }
        public PluginViewsFeatureProvider(IPluginLoader loader)
        {
            PluginLoader = loader;
        }
        public void PopulateFeature(IEnumerable<ApplicationPart> parts, ViewsFeature feature)
        {
            var knownIdentifiers = new HashSet<string>(StringComparer.OrdinalIgnoreCase);
            var descriptors = new List<CompiledViewDescriptor>();

            var plugins = PluginLoader.GetLoadedPlugins();
            var isDevelopment = PluginLoader.HostingEnvironment.IsDevelopment();
            foreach (var plugin in plugins.Where(m => m.Enable))
            {
                var attributes = GetViewAttributes(plugin.Assembly);

                foreach (var item in attributes)
                {
                    var descriptor = new CompiledViewDescriptor(item);
                    if (knownIdentifiers.Add(descriptor.RelativePath))
                    {
                        feature.ViewDescriptors.Add(descriptor);
                    }
                }
            }
        }
        protected virtual IEnumerable<RazorCompiledItem> GetViewAttributes(Assembly assembly)
        {
            return GetViewAttributesFromCurrentAssembly(assembly).Concat(GetViewAttributesLegacy(assembly));
        }

        private IEnumerable<RazorCompiledItem> GetViewAttributesLegacy(Assembly assembly)
        {
            if (assembly == null)
            {
                throw new ArgumentNullException(nameof(assembly));
            }

            var featureAssembly = GetViewAssembly(assembly);
            if (featureAssembly != null)
            {
                return new RazorCompiledItemLoader().LoadItems(featureAssembly);
            }

            return Enumerable.Empty<RazorCompiledItem>();
        }

        private Assembly GetViewAssembly(Assembly assembly)
        {
            if (assembly.IsDynamic || string.IsNullOrEmpty(assembly.Location))
            {
                return null;
            }

            for (var i = 0; i < ViewAssemblySuffixes.Count; i++)
            {
                var fileName = $"{assembly.GetName().Name}{ViewAssemblySuffixes[i]}.dll";
                var filePath = Path.Combine(Path.GetDirectoryName(assembly.Location), fileName);

                if (File.Exists(filePath))
                {
                    try
                    {
                        return Assembly.LoadFile(filePath);
                    }
                    catch (FileLoadException)
                    {
                        // Don't throw if assembly cannot be loaded. This can happen if the file is not a managed assembly.
                    }
                }
            }

            return null;
        }

        private static IEnumerable<RazorCompiledItem> GetViewAttributesFromCurrentAssembly(Assembly assembly)
        {
            if (assembly == null)
            {
                throw new ArgumentNullException(nameof(assembly));
            }

            return new RazorCompiledItemLoader().LoadItems(assembly);
        }
    }
}
