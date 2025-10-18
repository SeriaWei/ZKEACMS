/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace Easy.Mvc.Plugin
{
    public class PluginInfo
    {
        public string ID { get; set; }
        public string Name { get; set; }
        public string FileName { get; set; }
        public bool Enable { get; set; }
        public string Author { get; set; }
        public string Version { get; set; }
        public string WebSite { get; set; }
        public string Description { get; set; }
        public DateTime? PublishedDate { get; set; }

        //Additional Property
        [JsonIgnore]
        public string RelativePath { get; set; }
        [JsonIgnore]
        public string DirectoryName { get; set; }
        [JsonIgnore]
        public Assembly Assembly { get; set; }
        public HashSet<string> EmbeddedResource { get; set; }
    }
}
