/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Text;

namespace Easy
{
    public static class Helper
    {
        public static class Url
        {
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
                return path.StartsWith(Uri.UriSchemeFile, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeFtp, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeGopher, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeHttp, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeHttps, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeMailto, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeNetPipe, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeNetTcp, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeNews, StringComparison.OrdinalIgnoreCase) ||
                    path.StartsWith(Uri.UriSchemeNntp, StringComparison.OrdinalIgnoreCase);
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
