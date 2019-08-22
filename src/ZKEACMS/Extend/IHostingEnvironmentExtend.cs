using Microsoft.AspNetCore.Hosting;
using System.IO;
using System;

namespace ZKEACMS
{
    public static class IWebHostEnvironmentExtend
    {
        public static string MapPath(this IWebHostEnvironment env, string path)
        {
            return Path.Combine(env.ContentRootPath, path);
        }

        public static string MapPath(this IWebHostEnvironment env, params string[] paths)
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

        public static string MapWebRootPath(this IWebHostEnvironment env, string path)
        {
            return Path.Combine(env.WebRootPath, path);
        }

        public static string MapWebRootPath(this IWebHostEnvironment env, params string[] paths)
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
