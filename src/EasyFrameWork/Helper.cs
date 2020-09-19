/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Easy
{
    public static class Helper
    {
        public static class Url
        {
            static string[] schemes = new string[] {
                Uri.UriSchemeFile + ":", Uri.UriSchemeFtp + ":",Uri.UriSchemeGopher + ":",
                Uri.UriSchemeHttp + ":", Uri.UriSchemeHttps + ":",Uri.UriSchemeMailto + ":",
                Uri.UriSchemeNetPipe + ":",Uri.UriSchemeNetTcp + ":", Uri.UriSchemeNews + ":",
                Uri.UriSchemeNntp + ":"
            };
            public static string Combine(params string[] paths)
            {
                return "~/" + string.Join("/", paths);
            }

            public static bool ContainsScheme(string path)
            {
                if (path.IsNullOrEmpty())
                {
                    return false;
                }
                foreach (var item in schemes)
                {
                    if (path.StartsWith(item))
                    {
                        return true;
                    }
                }

                return false;
            }
            /// <summary>
            /// Convert path to start with "~/"
            /// </summary>
            /// <param name="path"></param>
            /// <returns></returns>
            public static string ToVirtualPath(string path)
            {
                if (path.IsNullOrEmpty())
                {
                    return "~/";
                }
                if (ContainsScheme(path))
                {
                    return path;
                }
                else if (path[0] == '~')
                {
                    return path;
                }
                else if (path[0] == '/')
                {
                    return $"~{path}";
                }
                return $"~/{path}";
            }
            /// <summary>
            /// Convert path to start with '/'
            /// </summary>
            /// <param name="path"></param>
            /// <returns></returns>
            public static string ToAbsolutePath(string path)
            {
                if (path.IsNullOrEmpty())
                {
                    return "/";
                }
                if (ContainsScheme(path))
                {
                    return path;
                }
                if (path[0] == '~')
                {
                    return path.Substring(1);
                }
                if (path[0] != '/')
                {
                    return $"/{path}";
                }
                return path;
            }
        }
    }
}
