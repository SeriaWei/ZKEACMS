/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.RepositoryPattern;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using ZKEACMS.PendingTask;

namespace ZKEACMS.EventAction.HttpParser
{
    public class HttpRequesetTaskHandler : PendingTaskHandler<HttpRequestContent>
    {
        public const string Name = "HttpRequesetTaskHandler";
        private readonly IHttpClientFactory _httpClientFactory;

        public HttpRequesetTaskHandler(IHttpClientFactory httpClientFactory)
        {
            _httpClientFactory = httpClientFactory;
        }

        public override Task<ServiceResult<string>> ExecuteAsync(object context)
        {
            return SendAsync(context as HttpRequestContent);
        }

        public async Task<ServiceResult<string>> SendAsync(HttpRequestContent httpRequest)
        {
            using (var response = await _httpClientFactory.CreateClient().SendAsync(httpRequest.ConvertToHttpRequestMessage()))
            {
                string responseContent = await response.Content.ReadAsStringAsync();
                if (!response.IsSuccessStatusCode) throw new Exception($"Send http request with error.\r\nPayload:\r\n{httpRequest}\r\nResponse:\r\n{responseContent}");

                return new ServiceResult<string>(responseContent);
            }
        }
    }
}
