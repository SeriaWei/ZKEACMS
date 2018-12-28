using Microsoft.Extensions.DependencyModel;
using Microsoft.Extensions.DependencyModel.Resolution;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Easy.Mvc.Plugin
{
    public class DependencyAssemblyResolver : ICompilationAssemblyResolver
    {
        public DependencyAssemblyResolver(string basePath)
        {
            BasePath = basePath;
        }
        public string BasePath { get; set; }
        public bool TryResolveAssemblyPaths(CompilationLibrary library, List<string> assemblies)
        {
            List<string> files = new List<string>();
            foreach (var item in library.Assemblies)
            {
                string filePath = Path.Combine(BasePath, Path.GetFileName(item));
                if (File.Exists(filePath))
                {
                    files.Add(filePath);
                }
            }
            if (files.Count == library.Assemblies.Count)
            {
                assemblies.AddRange(files);
                return true;
            }
            return false;
        }
    }
}
