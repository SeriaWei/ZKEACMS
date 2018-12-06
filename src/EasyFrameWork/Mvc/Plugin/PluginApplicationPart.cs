using Microsoft.AspNetCore.Mvc.ApplicationParts;
using Microsoft.Extensions.DependencyModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Easy.Mvc.Plugin
{
    public class PluginApplicationPart :
        ApplicationPart,
        IApplicationPartTypeProvider,
        ICompilationReferencesProvider
    {
        public PluginApplicationPart(Assembly assembly)
        {
            Assembly = assembly ?? throw new ArgumentNullException(nameof(assembly));
        }

        public Assembly Assembly { get; }
        
        public override string Name => Assembly.GetName().Name;
        
        public IEnumerable<TypeInfo> Types => Assembly.DefinedTypes;
        
        public IEnumerable<string> GetReferencePaths()
        {
            if (Assembly.IsDynamic)
            {
                return Enumerable.Empty<string>();
            }

            string currentName = Assembly.GetName().Name;

            var dependencyContext = DependencyContext.Load(Assembly)
                .CompileLibraries.Where(de => de.Name != currentName && !DependencyContext.Default.CompileLibraries.Any(m => m.Name == de.Name))
                .ToList();

            if (dependencyContext.Count > 0)
            {
                return dependencyContext.SelectMany(library => library.ResolveReferencePaths()).Concat(new[] { Assembly.Location });
            }
            
            return new[] { Assembly.Location };
        }
    }
}
