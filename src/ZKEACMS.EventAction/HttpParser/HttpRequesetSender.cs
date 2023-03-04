/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.EventAction.HttpParser
{
    public class HttpRequesetSender : IHttpRequesetSender
    {
        private readonly IHttpClientFactory _httpClientFactory;
        private readonly ILogger<HttpRequesetSender> _logger;

        public HttpRequesetSender(IHttpClientFactory httpClientFactory, ILogger<HttpRequesetSender> logger)
        {
            _httpClientFactory = httpClientFactory;
            _logger = logger;
        }

        public async Task SendAsync(HttpRequestContent httpRequest)
        {
            using (var response = await _httpClientFactory.CreateClient().SendAsync(httpRequest.ConvertToHttpRequestMessage()))
            {
                string responseContent = await response.Content.ReadAsStringAsync();
                if (response.IsSuccessStatusCode) return;

                _logger.LogError($"Send http request with error.\r\nPayload:\r\n{httpRequest}\r\nResponse:\r\n{responseContent}");
            }
        }
    }
}
