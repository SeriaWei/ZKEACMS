/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy;
using Easy.Extend;

namespace ZKEACMS.Page
{
    public class PageExistException : Exception
    {
        public PageExistException(ILocalize localize)
            : base(localize.Get("URL already exists"))
        {

        }
    }
}