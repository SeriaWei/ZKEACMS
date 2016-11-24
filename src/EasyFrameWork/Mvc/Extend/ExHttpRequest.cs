/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
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
        const string ImagePath = "~/UpLoad/Images";
        const string FilePath = "~/UpLoad/Files";

        public static string InitPath(IServiceProvider serviceProvider, string path)
        {
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }
            path += string.Format("\\{0}\\", DateTime.Now.ToString("yyyyMM"));
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
                var storage = serviceProvider.GetService<IStorageService>();
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
            return Path.Combine(environment.ContentRootPath, path.Replace("~/", ""));
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
                string path = InitPath(request.HttpContext.RequestServices, request.MapPath(ImagePath));
                string fileName = request.Form.Files[0].FileName;
                string ext = System.IO.Path.GetExtension(fileName);
                if (Common.IsImage(ext))
                {
                    fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
                    path += fileName;
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
                    return path.Replace(request.MapPath("~/"), "~/").Replace("\\", "/");
                }
            }
            return string.Empty;
        }
        public static string SaveImage(this HttpRequest request, string name)
        {
            if (request.Form.Files.Count > 0 && request.Form.Files[name].Length > 0)
            {
                string path = InitPath(request.HttpContext.RequestServices, request.MapPath(ImagePath));
                string fileName = request.Form.Files[name].FileName;
                string ext = System.IO.Path.GetExtension(fileName);
                if (Common.IsImage(ext))
                {
                    fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
                    path += fileName;
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
                    return path.Replace(request.MapPath("~/"), "~/").Replace("\\", "/");
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
                string path = InitPath(request.HttpContext.RequestServices, request.MapPath(FilePath));
                string fileName = request.Form.Files[0].FileName;
                string ext = System.IO.Path.GetExtension(fileName);
                if (Common.FileCanUp(ext))
                {
                    fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
                    path += fileName;
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
                    return path.Replace(request.MapPath("~/"), "~/").Replace("\\", "/");
                }
            }
            return string.Empty;
        }
        public static string SaveFile(this HttpRequest request, string name)
        {
            if (request.Form.Files.Count > 0 && request.Form.Files[0].Length > 0)
            {
                string path = InitPath(request.HttpContext.RequestServices, request.MapPath(FilePath));
                string fileName = request.Form.Files[0].FileName;
                string ext = System.IO.Path.GetExtension(fileName);
                if (Common.FileCanUp(ext))
                {
                    fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
                    path += fileName;
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
                    return path.Replace(request.MapPath("~/"), "~/").Replace("\\", "/");
                }
            }
            return string.Empty;
        }

        public static void DeleteFile(this HttpRequest request, string filePath)
        {
            try
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
            catch (Exception ex)
            {
                Logger.Error(ex);
            }

        }
    }
}
