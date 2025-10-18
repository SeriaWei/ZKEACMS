/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.Redirection.Models;

namespace ZKEACMS.Redirection.Service
{
    public interface IUrlRedirectService : IService<UrlRedirect>
    {
        IEnumerable<UrlRedirect> GetAll();
        UrlRedirect GetMatchedRedirection(string path);
    }
}
