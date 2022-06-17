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
        private readonly Dictionary<string, string> _headers;

        public WebClient(IHttpClientFactory httpClientFactory)
        {
            _httpClient = httpClientFactory.CreateClient();
            _headers = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            _headers.Add("User-Agent", UserAgent);
        }

        public void Dispose()
        {
            _httpClient.Dispose();
        }

        public async Task<byte[]> DownloadDataAsync(string requestUri)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, requestUri);
            SetHeaders(requestMessage);
            var responseMessage = await _httpClient.SendAsync(requestMessage);
            return await responseMessage.Content.ReadAsByteArrayAsync();
        }

        public async Task<string> DownloadStringAsync(string requestUri)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, requestUri);
            SetHeaders(requestMessage);
            var responseMessage = await _httpClient.SendAsync(requestMessage);
            return await responseMessage.Content.ReadAsStringAsync();
        }

        public async Task<Stream> GetStreamAsync(string requestUri)
        {
            var requestMessage = new HttpRequestMessage(HttpMethod.Get, requestUri);
            SetHeaders(requestMessage);
            var responseMessage = await _httpClient.SendAsync(requestMessage);
            return await responseMessage.Content.ReadAsStreamAsync();
        }

        public void RemoveHeader(string name, string value)
        {
            if (_headers.ContainsKey(name))
            {
                _headers.Remove(name);
            }
        }

        public void SetHeader(string name, string value)
        {
            _headers[name] = value;
        }

        private void SetHeaders(HttpRequestMessage httpRequestMessage)
        {
            foreach (var item in _headers)
            {
                httpRequestMessage.Headers.Add(item.Key, item.Value);
            }
        }
    }
}
