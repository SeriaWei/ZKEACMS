/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections.Generic;

namespace ZKEACMS.Media
{
    public interface IMediaService : IService<MediaEntity>
    {
        IList<MediaEntity> GetPage(string parentId, Pagination pagin);
        MediaEntity GetImageFolder();
    }
}