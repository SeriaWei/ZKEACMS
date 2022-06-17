/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;

namespace ZKEACMS.Page
{
    public interface IPageService : IService<PageEntity>
    {
        void Move(string id, int position, int oldPosition);
        PageEntity GetByPath(string path, bool isPreView);
        void MarkChanged(string pageId);
        ServiceResult<PageEntity> Publish(PageEntity item);
        void Revert(string ID, bool RetainLatest);
        void DeleteVersion(string ID);
        bool IsExists(string path);
    }
}