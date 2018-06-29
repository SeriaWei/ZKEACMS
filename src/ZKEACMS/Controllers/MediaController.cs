/* http://www.zkea.net/ 
 * Copyright 2016 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Extend;
using Easy.Image;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.Mvc.Extend;
using Easy.Net;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Formats.Jpeg;
using SixLabors.ImageSharp.PixelFormats;
using SixLabors.ImageSharp.Processing;
using SixLabors.ImageSharp.Processing.Transforms;
using SixLabors.Primitives;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using ZKEACMS.Common.ViewModels;
using ZKEACMS.Media;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewMedia)]
    public class MediaController : BasicController<MediaEntity, string, IMediaService>
    {
        private readonly ILogger _logger;
        private readonly WebClient _webClient;
        public MediaController(IMediaService service, ILoggerFactory loggerFactory, WebClient webClient)
            : base(service)
        {
            _logger = loggerFactory.CreateLogger<MediaController>();
            _webClient = webClient;
        }
        [NonAction]
        public override IActionResult Index()
        {
            return base.Index();
        }

        public IActionResult Index(string ParentId, int? pageIndex)
        {
            ParentId = ParentId ?? "#";
            Pagination pagin = new Pagination { PageIndex = pageIndex ?? 0 };
            var medias = Service.GetPage(ParentId, pagin);
            var viewModel = new MediaViewModel
            {
                ParentID = ParentId,
                Medias = medias,
                Pagin = pagin
            };
            if (ParentId != "#")
            {
                viewModel.Parent = Service.Get(ParentId);
                viewModel.Parents = new List<MediaEntity>();
                LoadParents(viewModel.Parent, viewModel.Parents);
            }
            return View("Index", viewModel);
        }

        private void LoadParents(MediaEntity parent, List<MediaEntity> parents)
        {
            if (parent != null)
            {
                parents.Insert(0, parent);
                if (parent.ParentID != "#")
                {
                    var p = Service.Get(parent.ParentID);
                    if (p != null)
                    {
                        LoadParents(p, parents);
                    }
                }
            }
        }

        public IActionResult Select(string ParentId, int? pageIndex)
        {
            ViewBag.PopUp = true;
            ViewBag.ShowToolBar = false;
            return Index(ParentId, pageIndex);
        }
        public IActionResult MultiSelect(string ParentId, int? pageIndex)
        {
            ViewBag.MultiSelect = true;
            return Select(ParentId, pageIndex);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMedia)]
        public JsonResult Save(string id, string title, string parentId)
        {
            MediaEntity entity = null;
            if (id.IsNotNullAndWhiteSpace() && title.IsNotNullAndWhiteSpace())
            {
                var media = Service.Get(id);
                media.Title = title;
                Service.Update(media);
                entity = Service.Get(id);
            }
            else if (title.IsNotNullAndWhiteSpace())
            {
                entity = new MediaEntity { Title = title, MediaType = (int)MediaType.Folder, ParentID = parentId };
                Service.Add(entity);
            }
            return Json(entity);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMedia)]
        public JsonResult Upload(string parentId, string folder, long size)
        {
            if (Request.Form.Files.Count > 0)
            {
                if (folder.IsNotNullAndWhiteSpace())
                {
                    var parent = Service.Get(m => m.Title == folder && m.MediaType == (int)MediaType.Folder).FirstOrDefault();
                    if (parent == null)
                    {
                        parent = new MediaEntity
                        {
                            Title = folder,
                            MediaType = (int)MediaType.Folder,
                            ParentID = "#"
                        };
                        Service.Add(parent);
                    }
                    parentId = parent.ID;
                }
                parentId = parentId ?? "#";
                string fileName = Path.GetFileName(Request.Form.Files[0].FileName);
                var entity = new MediaEntity
                {
                    ParentID = parentId,
                    Title = fileName,
                    Status = Request.Form.Files[0].Length == size ? (int)RecordStatus.Active : (int)RecordStatus.InActive
                };
                string extension = Path.GetExtension(fileName).ToLower();
                if (ImageHelper.IsImage(extension))
                {
                    entity.Url = Request.SaveImage();
                }
                else
                {
                    entity.Url = Request.SaveFile();
                }
                if (entity.Url.IsNotNullAndWhiteSpace())
                {
                    Service.Add(entity);
                    entity.Url = Url.Content(entity.Url);
                }
                return Json(entity);
            }
            return Json(false);
        }
        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMedia)]
        public JsonResult AppendFile(string id, long position, long size)
        {
            var media = Service.Get(id);
            if (media != null && Request.Form.Files.Count > 0)
            {
                if (position + Request.Form.Files[0].Length == size)
                {
                    media.Status = (int)RecordStatus.Active;
                    Service.Update(media);
                }
                var file = Request.MapPath(media.Url);
                if (System.IO.File.Exists(file))
                {
                    using (var fileStream = new FileStream(file, FileMode.Append))
                    {
                        Request.Form.Files[0].CopyTo(fileStream);
                    }
                    return Json(media);
                }
            }
            return Json(false);
        }
        [DefaultAuthorize(Policy = PermissionKeys.ManageMedia)]
        public override IActionResult Delete(string ids)
        {
            DeleteMedia(ids);
            return base.Delete(ids);
        }

        private void DeleteMedia(string mediaId)
        {
            var media = Service.Get(mediaId);
            if (media != null && media.MediaType != (int)MediaType.Folder)
            {
                if (media.Url.StartsWith("http://") || media.Url.StartsWith("https://"))
                {
                    media.Url = "~" + new Uri(media.Url).AbsolutePath;
                }
                Request.DeleteFile(media.Url);
            }
            else
            {
                Service.Get(m => m.ParentID == mediaId).Each(m => DeleteMedia(m.ID));
            }
            Service.Remove(mediaId);
        }
        public IActionResult Thumbnail(string id)
        {
            const int size = 220;
            using (var input = System.IO.File.OpenRead(Request.MapPath(Service.Get(id).Url)))
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    var image = Image.Load<Rgba32>(input);
                    image.Mutate(x => x.Resize(new ResizeOptions { Size = new Size(size, size), Mode = ResizeMode.Max }));
                    image.Save(ms, new JpegEncoder());
                    ms.Position = 0;
                    return File(ms.ToArray(), "image/jpeg");
                }
            }
        }

        [HttpPost]
        public IActionResult DownLoadExternalImage(string[] images)
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            //_webClient.Proxy = new System.Net.WebProxy("kyproxy.keyou.corp", 8080);

            string parentId = Service.GetImageFolder().ID;
            string path = Request.GetUploadPath();
            foreach (var item in images)
            {
                if (!result.ContainsKey(item))
                {
                    string ext = Path.GetExtension(item);
                    if (!Easy.Mvc.Common.IsImage(ext))
                    {
                        ext = ".jpg";
                    }
                    string filePath = Path.Combine(path, string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext));
                    try
                    {
                        using (MD5 md5hash = MD5.Create())
                        {
                            var id = GetMd5Hash(md5hash, item);
                            var media = Service.Get(id);
                            if (media != null)
                            {
                                result.Add(item, media.Url);
                            }
                            else
                            {
                                _webClient.DownloadFile(item, filePath);
                                string webPath = Request.ChangeToWebPath(filePath);
                                Service.Add(new MediaEntity
                                {
                                    ParentID = parentId,
                                    Title = Path.GetFileName(filePath),
                                    Status = (int)RecordStatus.Active,
                                    Url = webPath,
                                    ID = id
                                });
                                result.Add(item, webPath);
                            }
                        }

                    }
                    catch (Exception ex)
                    {
                        _logger.LogError(ex.Message);
                    }


                }
            }
            return Json(result.Select(m => new KeyValuePair<string, string>(m.Key, Url.Content(m.Value))));
        }
        string GetMd5Hash(MD5 md5Hash, string input)
        {
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}
