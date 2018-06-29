/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections;
using System.Collections.Generic;
using ZKEACMS.Page;

namespace ZKEACMS.Layout
{
    public interface ILayoutService : IService<LayoutEntity>
    {
        LayoutEntity GetByPage(PageEntity page);
        void UpdateDesign(LayoutEntity item);

        void MarkChanged(string ID);

        IList<LayoutEntity> GetWithFull();
    }
}