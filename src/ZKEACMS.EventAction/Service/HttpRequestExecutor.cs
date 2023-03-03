/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using Easy.Extend;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.EventAction.HttpParser;

namespace ZKEACMS.EventAction.Service
{
    public class HttpRequestExecutor : IHttpRequestExecutor
    {

        private readonly IHttpClientFactory _httpClientFactory;

        public HttpRequestExecutor(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        public string Execute(HttpRequestContent httpRequest)
        {
            var responseMessage = _httpClientFactory.CreateClient().Send(httpRequest.ConvertToHttpRequestMessage());
            using (StreamReader reader = new StreamReader(responseMessage.Content.ReadAsStream()))
            {
                return reader.ReadToEnd();
            }
        }

        public async Task<string> ExecuteAsync(HttpRequestContent httpRequest)
        {
            var responseMessage = await _httpClientFactory.CreateClient().SendAsync(httpRequest.ConvertToHttpRequestMessage());
            return await responseMessage.Content.ReadAsStringAsync();
        }

    }
}
