/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
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
