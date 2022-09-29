/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System.Collections.Generic;

namespace ZKEACMS.Media
{
    public interface IMediaService : IService<MediaEntity>
    {
        IList<MediaEntity> GetPage(string parentId, Pagination pagin);
        MediaEntity GetImageFolder();
        void AddMediaToImageFolder(MediaEntity entity);
    }
}