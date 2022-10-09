/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace ZKEACMS.Media
{
    public interface IMediaService : IService<MediaEntity>
    {
        Task<ServiceResult<MediaEntity>> UploadMediaAsync(MediaEntity entity, Stream fileStream);
        Task<ServiceResult<MediaEntity>> AppendMediaAsync(string id, Stream fileStream, bool isCompleted);
        IList<MediaEntity> GetPage(string parentId, Pagination pagin);
        MediaEntity GetImageFolder();
        Task<ServiceResult<MediaEntity>> AddMediaToImageFolderAsync(MediaEntity entity, Stream fileStream);
        Task<ServiceResult<MediaEntity>> UploadFromExternalImageAsync(string imageUrl);
        Task<ServiceResult<MediaEntity>> UploadFromBlobImageAsync(Stream stream, string fileName);
        
        Task<Stream> GetStreamAsync(string url);
    }
}