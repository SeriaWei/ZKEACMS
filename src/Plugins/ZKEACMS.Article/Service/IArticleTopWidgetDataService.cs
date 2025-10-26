/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Article.Service
{
    public interface IArticleTopWidgetDataService
    {
        void UpdateDetailPageUrl(string oldUrl, string newUrl);
    }
}
