/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.Extend;

namespace ZKEACMS.Page
{
    public class PageExistException : Exception
    {
        public PageExistException(PageEntity page)
            : base("已存在Url为 {0} 的页面".FormatWith(page.Url))
        {

        }
    }
}