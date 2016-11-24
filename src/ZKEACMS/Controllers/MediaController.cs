/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using System.Collections.Generic;
using System.IO;
using ZKEACMS.Common.ViewModels;
using Easy.Extend;
using Easy.Mvc.Authorize;
using Easy.Mvc.Controllers;
using ZKEACMS.Media;
using Microsoft.AspNetCore.Mvc;
using Easy.Mvc.Attribute;
using Easy.Mvc.Extend;
using Easy.Image;
using Easy.RepositoryPattern;
using System.Linq;

namespace ZKEACMS.Controllers
{
    [DefaultAuthorize]
    public class MediaController : BasicController<MediaEntity, string, IMediaService>
    {
        public MediaController(IMediaService service)
            : base(service)
        {
        }
        [NonAction]
        public override ActionResult Index()
        {
            return base.Index();
        }
        
        public ActionResult Index(string ParentId, int? pageIndex)
        {
            ParentId = ParentId ?? "#";
            Pagination pagin = new Pagination { PageIndex = pageIndex ?? 0 };
            var medias = Service.Get(m => m.ParentID == ParentId, pagin).OrderByDescending(m => m.CreateDate);
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
        
        public ActionResult Select(string ParentId, int? pageIndex)
        {
            ViewBag.PopUp = true;
            return Index(ParentId, pageIndex);
        }
        [HttpPost]
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
        [HttpPost]
        public JsonResult Upload(string parentId)
        {
            if (Request.Form.Files.Count > 0)
            {
                parentId = parentId ?? "#";
                string fileName = Request.Form.Files[0].FileName;
                var entity = new MediaEntity
                {
                    ParentID = parentId,
                    Title = fileName
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
        public override JsonResult Delete(string ids)
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
    }
}
