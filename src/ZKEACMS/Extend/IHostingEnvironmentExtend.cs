/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Hosting;
using System.IO;
using System;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Hosting.Internal;
using System.Linq;
using Easy.Extend;

namespace ZKEACMS
{
    public static class IWebHostEnvironmentExtend
    {
        private static string[] ToPathArray(string path)
        {
            return path.TrimStart('~').TrimStart('/').SplitWithDirectorySeparatorChar();
        }

        public static string MapPath(this IWebHostEnvironment env, string path)
        {
            return env.MapPath(ToPathArray(path));
        }

        public static string MapPath(this IWebHostEnvironment env, params string[] paths)
        {
            if (paths[0] == Easy.Mvc.Plugin.Loader.PluginFolder)
            {
                if (env.IsDevelopment())
                {
                    return Path.Combine(new DirectoryInfo(env.ContentRootPath).Parent.FullName, Path.Combine(paths));
                }
                return Path.Combine(env.ContentRootPath, Path.Combine(paths));
            }
            return Path.Combine(env.WebRootPath, Path.Combine(paths));
        }
    }
}
