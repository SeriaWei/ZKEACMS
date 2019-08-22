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
using Easy.Storage;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.Common.ViewModels;
using ZKEACMS.Media;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewMedia)]
    public class MediaController : BasicController<MediaEntity, string, IMediaService>
    {
        private readonly ILogger _logger;
        private readonly WebClient _webClient;
        private readonly IStorage _storage;
        public MediaController(IMediaService service,
            ILoggerFactory loggerFactory,
            WebClient webClient,
            IStorage storage)
            : base(service)
        {
            _logger = loggerFactory.CreateLogger<MediaController>();
            _webClient = webClient;
            _storage = storage;
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
        public async Task<IActionResult> Upload(string parentId, string folder, long size)
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
                string fileId = new Easy.IDGenerator().CreateStringId();
                entity.Url = await _storage.SaveFileAsync(Request.Form.Files[0].OpenReadStream(), $"{fileId}{extension}");
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
        public async Task<IActionResult> AppendFile(string id, long position, long size)
        {
            var media = Service.Get(id);
            if (media != null && Request.Form.Files.Count > 0)
            {
                if (position + Request.Form.Files[0].Length == size)
                {
                    media.Status = (int)RecordStatus.Active;
                    Service.Update(media);
                }
                await _storage.AppendFileAsync(Request.Form.Files[0].OpenReadStream(), media.Url);
                media.Url = Url.Content(media.Url);
                return Json(media);
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

                _storage.Delete(media.Url);
            }
            else
            {
                Service.Get(m => m.ParentID == mediaId).Each(m => DeleteMedia(m.ID));
            }
            Service.Remove(mediaId);
        }
        //public IActionResult Thumbnail(string id)
        //{
        //    const int size = 220;
        //    using (var input = System.IO.File.OpenRead(Request.MapPath(Service.Get(id).Url)))
        //    {
        //        MemoryStream ms = new MemoryStream();
        //        using (var image = Image.Load<Rgba32>(input))
        //        {
        //            image.Mutate(x => x.Resize(new ResizeOptions { Size = new Size(size, size), Mode = ResizeMode.Max }));
        //            image.Save(ms, new JpegEncoder());
        //            ms.Position = 0;
        //            return File(ms, "image/jpeg");
        //        }
        //    }
        //}

        [HttpPost]
        public IActionResult DownLoadExternalImage(string[] images)
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            //_webClient.Proxy = new System.Net.WebProxy("kyproxy.keyou.corp", 8080);

            string parentId = Service.GetImageFolder().ID;
            foreach (var item in images)
            {
                if (!result.ContainsKey(item))
                {
                    string ext = Path.GetExtension(item);
                    if (!Easy.Mvc.Common.IsImage(ext))
                    {
                        ext = ".jpg";
                    }
                    string fileName = string.Format("{0}{1}", Guid.NewGuid().ToString("N"), ext);
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
                                string url = _storage.SaveFile(_webClient.OpenRead(item), fileName);
                                Service.Add(new MediaEntity
                                {
                                    ParentID = parentId,
                                    Title = fileName,
                                    Status = (int)RecordStatus.Active,
                                    Url = url,
                                    ID = id
                                });
                                result.Add(item, url);
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

        protected override void Dispose(bool disposing)
        {
            _webClient.Dispose();
            base.Dispose(disposing);
        }
    }
}
