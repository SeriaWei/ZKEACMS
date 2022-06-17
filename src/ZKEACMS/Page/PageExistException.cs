/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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