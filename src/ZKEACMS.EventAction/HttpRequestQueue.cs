/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Notification;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Channels;
using System.Threading.Tasks;
using ZKEACMS.EventAction.HttpParser;

namespace ZKEACMS.EventAction
{
    public class HttpRequestQueue : IHttpRequestQueue
    {
        private readonly Channel<HttpRequestContent> _channel;

        public HttpRequestQueue()
        {
            _channel = Channel.CreateUnbounded<HttpRequestContent>(); ;
        }

        public async Task Push(HttpRequestContent httpRequest)
        {
            await _channel.Writer.WriteAsync(httpRequest);
        }

        public async Task<HttpRequestContent> Receive(CancellationToken cancellationToken = default)
        {
            return await _channel.Reader.ReadAsync(cancellationToken);
        }
    }
}
