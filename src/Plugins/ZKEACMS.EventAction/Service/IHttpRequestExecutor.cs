/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.EventAction.HttpParser;

namespace ZKEACMS.EventAction.Service
{
    public interface IHttpRequestExecutor
    {
        string Execute(HttpRequestContent httpRequest);

        Task<string> ExecuteAsync(HttpRequestContent httpRequest);
    }
}
