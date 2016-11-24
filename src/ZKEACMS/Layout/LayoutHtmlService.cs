/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace ZKEACMS.Layout
{
    public class LayoutHtmlService : ServiceBase<LayoutHtml>
    {
        public IEnumerable<LayoutHtml> GetByLayoutID(string layoutId)
        {
            return DbContext.Instance.Where(m => m.LayoutId == layoutId).OrderBy(m => m.LayoutHtmlId);
        }
    }
}
