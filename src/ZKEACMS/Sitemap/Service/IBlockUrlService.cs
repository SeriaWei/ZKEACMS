/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Sitemap.Service
{
    public interface IBlockUrlService
    {
        HashSet<string> GetAll();
    }
}
