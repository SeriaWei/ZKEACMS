/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Net
{
    public class WebClient : IWebClient
    {
        const string UserAgent = "Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3438.3 Safari/537.36";

        private readonly HttpClient _httpClient;

        public WebClient(IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClientFactory.CreateClient();
            _httpClient.DefaultRequestHeaders.Add("User-Agent", UserAgent);
        }

        public void Dispose()
        {
            _httpClient.Dispose();
        }

        public async Task<byte[]> DownloadDataAsync(string requestUri)
        {
            return await _httpClient.GetByteArrayAsync(requestUri);
        }

        public async Task<string> DownloadStringAsync(string requestUri)
        {
            return await _httpClient.GetStringAsync(requestUri);
        }

        public async Task<Stream> GetStreamAsync(string requestUri)
        {
            return await _httpClient.GetStreamAsync(requestUri);
        }
    }
}
