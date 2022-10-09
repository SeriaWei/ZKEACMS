/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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
using Easy.Storage;
using System.Threading.Tasks;
using AngleSharp.Io;
using Easy.Constant;
using Easy.Net;
using System.Security.Cryptography;
using System.Text;

namespace ZKEACMS.Media
{
    public class MediaService : ServiceBase<MediaEntity, CMSDbContext>, IMediaService
    {
        private readonly IStorage _storage;
        private readonly IWebClient _webClient;
        public MediaService(IApplicationContext applicationContext,
            CMSDbContext dbContext,
            IStorage storage,
            IWebClient webClient) : base(applicationContext, dbContext)
        {
            _storage = storage;
            _webClient = webClient;
        }

        public override DbSet<MediaEntity> CurrentDbSet => DbContext.Media;

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
            SetMediaType(item);
            return base.Add(item);
        }

        private static void SetMediaType(MediaEntity item)
        {
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
        }

        public async Task<ServiceResult<MediaEntity>> AddMediaToImageFolderAsync(MediaEntity entity, Stream fileStream)
        {
            entity.ParentID = GetImageFolder().ID;
            return await UploadMediaAsync(entity, fileStream);
        }

        public async Task<ServiceResult<MediaEntity>> AppendMediaAsync(string id, Stream fileStream, bool isCompleted)
        {
            var media = Get(id);
            if (media == null) return null;

            await _storage.AppendFileAsync(fileStream, media.Url);
            if (isCompleted)
            {
                media.Status = (int)RecordStatus.Active;
                Update(media);
            }
            return new ServiceResult<MediaEntity>(media);
        }

        public async Task<ServiceResult<MediaEntity>> UploadFromExternalImageAsync(string imageUrl)
        {
            string ext = Path.GetExtension(imageUrl);
            if (!Easy.Mvc.Common.IsImage(ext)) return new ServiceResult<MediaEntity>();

            string id = CreateIdByUrl(imageUrl);
            var media = Get(id);
            if (media == null)
            {
                Stream requestStream = await GetStreamAsync(imageUrl);
                media = (await AddMediaToImageFolderAsync(new MediaEntity
                {
                    ID = id,
                    Title = string.Format("{0}{1}", new IDGenerator().CreateStringId(), ext),
                    Status = (int)RecordStatus.Active
                }, requestStream))?.Result;
            }
            return new ServiceResult<MediaEntity>(media);
        }

        public MediaEntity GetImageFolder()
        {
            const string imageFolder = "Images";
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

        public async Task<ServiceResult<MediaEntity>> UploadFromBlobImageAsync(Stream stream, string fileName)
        {
            string id;
            using (MemoryStream ms = new MemoryStream())
            {
                stream.CopyTo(ms);
                id = GetMd5Hash(ms.ToArray());
            }
            stream.Position = 0;
            MediaEntity entity = Get(id);
            if (entity != null) return new ServiceResult<MediaEntity>(entity);

            entity = new MediaEntity
            {
                ID = id,
                MediaType = (int)MediaType.Image,
                Title = fileName,
                Status = (int)RecordStatus.Active
            };
            return await AddMediaToImageFolderAsync(entity, stream);
        }

        public IList<MediaEntity> GetPage(string parentId, Pagination pagin)
        {
            pagin.RecordCount = Count(m => m.ParentID == parentId);
            return Get().Where(m => m.ParentID == parentId)
                        .OrderBy(m => m.MediaType)
                        .ThenByDescending(m => m.CreateDate)
                        .Skip(pagin.PageIndex * pagin.PageSize)
                        .Take(pagin.PageSize)
                        .ToList();
        }

        public Task<Stream> GetStreamAsync(string url)
        {
            return _webClient.GetStreamAsync(url);
        }

        public override void Remove(MediaEntity item)
        {
            Remove(m => m.ParentID == item.ID);
            DeleteFile(item);
            base.Remove(item);
        }

        private void DeleteFile(MediaEntity item)
        {
            if (item != null && item.MediaType != (int)MediaType.Folder)
            {
                if (item.Url.StartsWith("http://") || item.Url.StartsWith("https://"))
                {
                    item.Url = "~" + new Uri(item.Url).AbsolutePath;
                }

                _storage.Delete(item.Url);
            }
        }

        public override void Remove(Expression<Func<MediaEntity, bool>> filter)
        {
            Get(filter).Each(m =>
            {
                DeleteFile(m);
                Remove(m => m.ParentID == m.ID);
            });
            base.Remove(filter);
        }
        public override void RemoveRange(params MediaEntity[] items)
        {
            items.Each(m =>
            {
                DeleteFile(m);
                Remove(m => m.ParentID == m.ID);
            });
            base.RemoveRange(items);
        }

        public async Task<ServiceResult<MediaEntity>> UploadMediaAsync(MediaEntity entity, Stream fileStream)
        {
            string extension = Path.GetExtension(entity.Title).ToLower();
            string fileId = new IDGenerator().CreateStringId();
            entity.Url = await _storage.SaveFileAsync(fileStream, $"{fileId}{extension}");
            return Add(entity);
        }

        private string CreateIdByUrl(string url)
        {
            return GetMd5Hash(Encoding.UTF8.GetBytes(url));
        }
        private string GetMd5Hash(byte[] input)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                byte[] data = md5Hash.ComputeHash(input);
                StringBuilder sBuilder = new StringBuilder();
                for (int i = 0; i < data.Length; i++)
                {
                    sBuilder.Append(data[i].ToString("x2"));
                }
                return sBuilder.ToString();
            }
        }
    }
}