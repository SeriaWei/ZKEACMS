/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using ZKEACMS.EventAction.HttpParser;

namespace ZKEACMS.EventAction
{
    public interface IHttpRequestQueue
    {
        Task Push(HttpRequestContent emailMessage);
        Task<HttpRequestContent> Receive(CancellationToken cancellationToken = default);
    }
}
