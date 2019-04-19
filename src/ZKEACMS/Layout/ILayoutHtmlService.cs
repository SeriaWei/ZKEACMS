/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections.Generic;
using ZKEACMS.Page;

namespace ZKEACMS.Layout
{
    public interface ILayoutHtmlService : IService<LayoutHtml>
    {
        IEnumerable<LayoutHtml> GetByPage(PageEntity page);
        IEnumerable<LayoutHtml> GetByLayoutID(string layoutId);
        void RemoveCache(string pageId);
        void ClearCache();
    }
}