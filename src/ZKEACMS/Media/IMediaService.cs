/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy;
using Easy.RepositoryPattern;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace ZKEACMS.Media
{
    public interface IMediaService : IService<MediaEntity>
    {
        Task<ErrorOr<MediaEntity>> UploadMediaAsync(MediaEntity entity, Stream fileStream);
        Task<ErrorOr<MediaEntity>> AppendMediaAsync(string id, Stream fileStream, bool isCompleted);
        IList<MediaEntity> GetPage(string parentId, Pagination pagin);
        MediaEntity GetImageFolder();
        Task<ErrorOr<MediaEntity>> AddMediaToImageFolderAsync(MediaEntity entity, Stream fileStream);
        Task<ErrorOr<MediaEntity>> UploadFromExternalImageAsync(string imageUrl);
        Task<ErrorOr<MediaEntity>> UploadFromBlobImageAsync(Stream stream, string fileName);
        
        Task<Stream> GetStreamAsync(string url);
    }
}