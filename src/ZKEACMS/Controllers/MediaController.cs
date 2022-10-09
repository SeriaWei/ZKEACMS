/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Constant;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using Easy.RepositoryPattern;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Common.ViewModels;
using ZKEACMS.Media;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize(Policy = PermissionKeys.ViewMedia)]
    public class MediaController : BasicController<MediaEntity, string, IMediaService>
    {
        private readonly ILogger _logger;
        public MediaController(IMediaService service,
            ILoggerFactory loggerFactory)
            : base(service)
        {
            _logger = loggerFactory.CreateLogger<MediaController>();
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
                string pId = GetParentId(parentId, folder);
                IFormFile formFile = Request.Form.Files[0];
                string fileName = Path.GetFileName(formFile.FileName);
                var entity = new MediaEntity
                {
                    ParentID = pId,
                    Title = fileName,
                    Status = formFile.Length == size ? (int)RecordStatus.Active : (int)RecordStatus.InActive
                };
                await Service.UploadMediaAsync(entity, formFile.OpenReadStream());

                if (entity.Url.IsNotNullAndWhiteSpace())
                {
                    entity.Url = Url.Content(entity.Url);
                }
                return Json(entity);
            }
            return Json(false);
        }

        private string GetParentId(string parentId, string folder)
        {
            if (parentId.IsNotNullAndWhiteSpace()) return parentId;

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
                return parent.ID;
            }

            return "#";
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMedia)]
        public async Task<IActionResult> AppendFile(string id, long position, long size)
        {
            if (Request.Form.Files.Count > 0)
            {
                bool isCompleted = position + Request.Form.Files[0].Length == size;

                var media = (await Service.AppendMediaAsync(id, Request.Form.Files[0].OpenReadStream(), isCompleted))?.Result;
                if (media == null) return Json(false);

                media.Url = Url.Content(media.Url);
                return Json(media);
            }
            return Json(false);
        }

        [HttpPost, DefaultAuthorize(Policy = PermissionKeys.ManageMedia)]
        public async Task<IActionResult> UploadBlob([FromForm] IFormCollection formData)
        {
            if (formData.Files.Count > 0)
            {
                Stream stream = formData.Files[0].OpenReadStream();
                var media = (await Service.UploadFromBlobImageAsync(stream, formData.Files[0].FileName))?.Result;
                if (media != null)
                {
                    return Json(new { location = Url.Content(media.Url) });
                }
            }
            return Json(null);
        }

        [DefaultAuthorize(Policy = PermissionKeys.ManageMedia)]
        public override IActionResult Delete(string ids)
        {
            return base.Delete(ids);
        }

        [HttpPost]
        public async Task<IActionResult> DownLoadExternalImage(string[] images)
        {
            Dictionary<string, string> result = new Dictionary<string, string>();

            foreach (var imgUrl in images)
            {
                if (result.ContainsKey(imgUrl)) continue;

                try
                {
                    var media = (await Service.UploadFromExternalImageAsync(imgUrl))?.Result;
                    if (media == null) continue;

                    result.Add(imgUrl, Url.Content(media.Url));
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex.Message);
                }
            }
            return Json(result.Select(m => new KeyValuePair<string, string>(m.Key, Url.Content(m.Value))));
        }


        public async Task<IActionResult> Proxy(string url)
        {
            return File(await Service.GetStreamAsync(url), "image/jpeg");
        }
    }
}
