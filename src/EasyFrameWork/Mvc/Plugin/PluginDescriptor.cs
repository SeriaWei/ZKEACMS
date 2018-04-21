﻿using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Easy.Mvc.Plugin
{
    public class PluginDescriptor
    {
        public Type PluginType { get; set; }
        public Assembly Assembly { get; set; }
        public string CurrentPluginPath { get; set; }
    }
}
