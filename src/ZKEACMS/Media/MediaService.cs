/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Extend;
using Easy.Image;
using Easy.RepositoryPattern;
using System;
using System.IO;
using System.Linq.Expressions;
using Easy;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;

namespace ZKEACMS.Media
{
    public class MediaService : ServiceBase<MediaEntity>, IMediaService
    {
        public MediaService(IApplicationContext applicationContext, CMSDbContext dbContext) : base(applicationContext, dbContext)
        {
        }

        public override DbSet<MediaEntity> CurrentDbSet => (DbContext as CMSDbContext).Media;

        public override ServiceResult<MediaEntity> Add(MediaEntity item)
        {
            if (item.ID.IsNullOrEmpty())
            {
                item.ID = Guid.NewGuid().ToString("N");
            }            
            if (item.ParentID.IsNullOrWhiteSpace())
            {
                item.ParentID = "#";
            }
            if (item.Url.IsNotNullAndWhiteSpace())
            {
                string extension = Path.GetExtension(item.Url);
                if (ImageHelper.IsImage(extension))
                {
                    item.MediaType = (int)MediaType.Image;
                }
                else if (FileExtensions.Video.Contains(extension))
                {
                    item.MediaType = (int)MediaType.Video;
                }
                else if (FileExtensions.Zip.Contains(extension))
                {
                    item.MediaType = (int)MediaType.Zip;
                }
                else if (FileExtensions.Pdf.Contains(extension))
                {
                    item.MediaType = (int)MediaType.Pdf;
                }
                else if (FileExtensions.Txt.Contains(extension))
                {
                    item.MediaType = (int)MediaType.Txt;
                }
                else if (FileExtensions.Doc.Contains(extension))
                {
                    item.MediaType = (int)MediaType.Doc;
                }
                else if (FileExtensions.Excel.Contains(extension))
                {
                    item.MediaType = (int)MediaType.Excel;
                }
                else if (FileExtensions.Pdf.Contains(extension))
                {
                    item.MediaType = (int)MediaType.Pdf;
                }
                else
                {
                    item.MediaType = (int)MediaType.Other;
                }
            }
            else
            {
                item.MediaType = (int)MediaType.Folder;
            }
            return base.Add(item);
        }

        public MediaEntity GetImageFolder()
        {
            const string imageFolder = "图片";
            var folder = Get(m => m.Title == imageFolder && m.MediaType == (int)MediaType.Folder).FirstOrDefault();
            if (folder == null)
            {
                folder = new MediaEntity
                {
                    Title = imageFolder,
                    MediaType = (int)MediaType.Folder,
                    ParentID = "#"
                };
                Add(folder);
            }
            return folder;
        }

        public IList<MediaEntity> GetPage(string parentId, Pagination pagin)
        {
            pagin.RecordCount = Count(m => m.ParentID == parentId);
            return Get().Where(m => m.ParentID == parentId).OrderBy(m => m.MediaType).ThenByDescending(m => m.CreateDate).Skip(pagin.PageIndex * pagin.PageSize).Take(pagin.PageSize).ToList();
        }

        public override void Remove(MediaEntity item)
        {
            Remove(m => m.ParentID == item.ID);
            base.Remove(item);
        }

        public override void Remove(Expression<Func<MediaEntity, bool>> filter)
        {
            Get(filter).Each(m =>
            {
                Remove(m.ParentID == m.ID);
            });
            base.Remove(filter);
        }
        public override void RemoveRange(params MediaEntity[] items)
        {
            items.Each(m =>
            {
                Remove(m.ParentID == m.ID);
            });
            base.RemoveRange(items);
        }
    }
}