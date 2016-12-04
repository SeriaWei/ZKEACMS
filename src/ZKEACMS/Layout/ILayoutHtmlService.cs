/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections.Generic;

namespace ZKEACMS.Layout
{
    public interface ILayoutHtmlService : IService<LayoutHtml>
    {
        IEnumerable<LayoutHtml> GetByLayoutID(string layoutId);
    }
}