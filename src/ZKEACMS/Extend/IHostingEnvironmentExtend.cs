using Microsoft.AspNetCore.Hosting;
using System.IO;
using System;

namespace ZKEACMS
{
    public static class IHostingEnvironmentExtend
    {
        public static string MapPath(this IHostingEnvironment env, string path)
        {
            return Path.Combine(env.ContentRootPath, path);
        }

        public static string MapPath(this IHostingEnvironment env, string[] paths)
        {
            string path = env.ContentRootPath;
            if (paths != null && paths.Length > 0)
            {
                foreach (var item in paths)
                {
                    path = Path.Combine(path, item);
                }
            }
            return path;
        }

        public static string MapWebRootPath(this IHostingEnvironment env , string path)
        {
            return Path.Combine(env.WebRootPath, path);
        }

        public static string MapWebRootPath(this IHostingEnvironment env, string[] paths)
        {
            string path = env.WebRootPath;
            if (paths != null && paths.Length > 0)
            {
                foreach (var item in paths)
                {
                    path = Path.Combine(path, item);
                }
            }
            return path;
        }
    }
}
