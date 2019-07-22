/* 
 * http://www.zkea.net/ 
 * Copyright 2017 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */
using System;

namespace ZKEACMS
{
    public class PermissionDescriptor : Easy.Modules.Role.PermissionDescriptor
    {
        public PermissionDescriptor() : base() { }

        public PermissionDescriptor(string key, string module, string title, string description)
            : base(key, module, title, description)
        {

        }
        public Func<bool> IsAvailable { get; set; }
        public string PluginName { get; set; }
    }
}
