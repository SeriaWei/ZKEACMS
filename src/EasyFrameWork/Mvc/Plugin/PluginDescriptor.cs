/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */
using Microsoft.Extensions.DependencyModel;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Easy.Mvc.Plugin
{
    public class PluginDescriptor
    {
        public Type PluginType { get; set; }
        public Assembly Assembly { get; set; }
        public List<CompilationLibrary> Dependency { get; set; }
        public string CurrentPluginPath { get; set; }
    }
}
