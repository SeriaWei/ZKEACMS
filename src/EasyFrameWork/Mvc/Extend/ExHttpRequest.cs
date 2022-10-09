/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using Easy.Storage;
using Easy.Extend;
using Microsoft.AspNetCore.Http;
using System.IO;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;

namespace Easy.Mvc.Extend
{
    public static class ExHttpRequest
    {
        public static string MapPath(this HttpRequest request, string path)
        {
            if (string.IsNullOrEmpty(path))
            {
                throw new ArgumentException($"\"{nameof(path)}\" can not be null.", nameof(path));
            }

            var environment = request.HttpContext.RequestServices.GetService<IWebHostEnvironment>();
            return Path.Combine(environment.WebRootPath, path.TrimStart('~').TrimStart('/').ToFilePath());
        }
        /// <summary>
        /// 保存图片到UpLoad/Images
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public static string SaveImage(this HttpRequest request)
        {
            if (request.Form.Files.Count > 0 && request.Form.Files[0].Length > 0)
            {
                string fileName = request.Form.Files[0].FileName;
                string ext = Path.GetExtension(fileName);
                if (Common.IsImage(ext))
                {
                    IStorage storage = request.HttpContext.RequestServices.GetService<IStorage>();
                    using (Stream stream = request.Form.Files[0].OpenReadStream())
                    {
                        return storage.SaveFile(stream, string.Format("{0}{1}", new Easy.IDGenerator().CreateStringId(), ext));
                    }

                }
            }
            return string.Empty;
        }
        /// <summary>
        /// 保存文件到UpLoad/Files
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public static string SaveFile(this HttpRequest request)
        {
            if (request.Form.Files.Count > 0 && request.Form.Files[0].Length > 0)
            {
                string fileName = request.Form.Files[0].FileName;
                string ext = Path.GetExtension(fileName);
                if (Common.IsExecuteableFile(ext)) return string.Empty;

                IStorage storage = request.HttpContext.RequestServices.GetService<IStorage>();
                using (Stream stream = request.Form.Files[0].OpenReadStream())
                {
                    return storage.SaveFile(stream, string.Format("{0}{1}", new Easy.IDGenerator().CreateStringId(), ext));
                }

            }
            return string.Empty;
        }

        public static void DeleteFile(this HttpRequest request, string filePath)
        {
            string file = request.MapPath(filePath);
            if (File.Exists(file))
            {
                File.Delete(file);
            }
        }

        public static string GetAbsoluteUrl(this HttpRequest request)
        {
            return request.Path.Value + request.QueryString;
        }
        public static string GetReferer(this HttpRequest request)
        {
            string uri = request.Headers["Referer"].ToString();
            if (uri.IsNotNullAndWhiteSpace() && !Uri.TryCreate(uri, UriKind.Absolute, out _)) return null;
            return uri;
        }
    }
}
