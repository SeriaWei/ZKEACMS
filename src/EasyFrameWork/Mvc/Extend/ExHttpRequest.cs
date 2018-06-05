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
        const string UploadFolder = "UpLoad";
        const string ImageFolder = "Images";
        const string FileFolder = "Files";

        public static string ChangeToWebPath(this HttpRequest request, string path)
        {
            return path.Replace(request.MapPath("~/"), "~").Replace("\\", "/");
        }
        public static string GetUploadPath(this HttpRequest request, string folder = ImageFolder)
        {
            var environment = request.HttpContext.RequestServices.GetService<IHostingEnvironment>();
            var path = Path.Combine(new string[] { environment.WebRootPath, UploadFolder, folder, DateTime.Now.ToString("yyyyMM") });
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
                var storage = request.HttpContext.RequestServices.GetService<IStorageService>();
                if (storage != null)
                {
                    storage.CreateFolder(path);
                }
            }
            return path;
        }
        public static string MapPath(this HttpRequest request, string path)
        {
            var environment = request.HttpContext.RequestServices.GetService<IHostingEnvironment>();
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
                string path = request.GetUploadPath(ImageFolder);
                string fileName = request.Form.Files[0].FileName;
                string ext = Path.GetExtension(fileName);
                if (Common.IsImage(ext))
                {
                    path = Path.Combine(path, string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext));
                    request.Form.Files[0].SaveAs(path);
                    var storage = request.HttpContext.RequestServices.GetService<IStorageService>();
                    if (storage != null)
                    {
                        string filePath = storage.SaveFile(path);
                        if (filePath.IsNotNullAndWhiteSpace())
                        {
                            return filePath;
                        }
                    }
                    return request.ChangeToWebPath(path);
                }
            }
            return string.Empty;
        }
        public static string SaveImage(this HttpRequest request, string name)
        {
            if (request.Form.Files.Count > 0 && request.Form.Files[name].Length > 0)
            {
                string path = request.GetUploadPath(ImageFolder);
                string fileName = request.Form.Files[name].FileName;
                string ext = Path.GetExtension(fileName);
                if (Common.IsImage(ext))
                {
                    fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
                    path = Path.Combine(path, fileName);
                    request.Form.Files[name].SaveAs(path);
                    var storage = request.HttpContext.RequestServices.GetService<IStorageService>();
                    if (storage != null)
                    {
                        string filePath = storage.SaveFile(path);
                        if (filePath.IsNotNullAndWhiteSpace())
                        {
                            return filePath;
                        }
                    }
                    return request.ChangeToWebPath(path);
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
                string path = request.GetUploadPath(FileFolder);
                string fileName = request.Form.Files[0].FileName;
                string ext = Path.GetExtension(fileName);
                if (Common.FileCanUp(ext))
                {
                    fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
                    path = Path.Combine(path, fileName);
                    request.Form.Files[0].SaveAs(path);
                    var storage = request.HttpContext.RequestServices.GetService<IStorageService>();
                    if (storage != null)
                    {
                        string filePath = storage.SaveFile(path);
                        if (filePath.IsNotNullAndWhiteSpace())
                        {
                            return filePath;
                        }
                    }
                    return request.ChangeToWebPath(path);
                }
            }
            return string.Empty;
        }
        public static string SaveFile(this HttpRequest request, string name)
        {
            if (request.Form.Files.Count > 0 && request.Form.Files[0].Length > 0)
            {
                string path = request.GetUploadPath(FileFolder);
                string fileName = request.Form.Files[0].FileName;
                string ext = Path.GetExtension(fileName);
                if (Common.FileCanUp(ext))
                {
                    fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
                    path = Path.Combine(path, fileName);
                    request.Form.Files[0].SaveAs(path);
                    var storage = request.HttpContext.RequestServices.GetService<IStorageService>();
                    if (storage != null)
                    {
                        string filePath = storage.SaveFile(path);
                        if (filePath.IsNotNullAndWhiteSpace())
                        {
                            return filePath;
                        }
                    }
                    return request.ChangeToWebPath(path);
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
            var storage = request.HttpContext.RequestServices.GetService<IStorageService>();
            if (storage != null)
            {
                storage.DeleteFile(file);
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
