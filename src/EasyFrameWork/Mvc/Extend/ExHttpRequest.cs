/* 
 * http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses 
 */
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
            var environment = request.HttpContext.RequestServices.GetService<IWebHostEnvironment>();
            path = path.Replace("~/", "").Trim('/').Trim('\\');
            return Path.Combine(environment.WebRootPath, path.ToFilePath());
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
                    return storage.SaveFile(request.Form.Files[0].OpenReadStream(), string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext));
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
                if (Common.FileCanUp(ext))
                {
                    IStorage storage = request.HttpContext.RequestServices.GetService<IStorage>();
                    return storage.SaveFile(request.Form.Files[0].OpenReadStream(), string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext));

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
            return request.Headers["Referer"].ToString();
        }
        public static string GetHostWithScheme(this HttpRequest request)
        {
            return request.Scheme + "://" + request.Host;
        }
    }
}
