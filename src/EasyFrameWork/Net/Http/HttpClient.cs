/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Threading.Tasks;

namespace Easy.Net.Http
{
    public class HttpClient
    {
        public Encoder Encoder { get; }

        protected Environment Environment;
        private System.Net.Http.HttpClient _client;
        private List<IInjector> _injectors;

        public HttpClient(Environment environment)
        {
            this.Environment = environment;
            this._injectors = new List<IInjector>();
            this.Encoder = new Encoder();

            _client = new System.Net.Http.HttpClient();
            _client.BaseAddress = new Uri(environment.BaseUrl());
            _client.DefaultRequestHeaders.Add("User-Agent", GetUserAgent());
        }

        protected virtual string GetUserAgent()
        {
            return "Mozilla/5.0 (Windows NT 10.0; Win64; x64)";
        }

        public void AddInjector(IInjector injector)
        {
            if (injector != null)
            {
                this._injectors.Add(injector);
            }
        }

        public void SetConnectTimeout(TimeSpan timeout)
        {
            _client.Timeout = timeout;
        }

        public virtual async Task<HttpResponse> Execute<T>(T req) where T: HttpRequest
        {
            var request = req.Clone<T>();

            foreach (var injector in _injectors) {
                injector.Inject(request);
            }

            request.RequestUri = new Uri(this.Environment.BaseUrl() + request.Path);

            if (request.Body != null)
            {
                request.Content = Encoder.SerializeRequest(request);
            }

			var response = await _client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                object responseBody = null;
                if (response.Content.Headers.ContentType != null)
                {
                    responseBody = Encoder.DeserializeResponse(response.Content, request.ResponseType);
                }
                return new HttpResponse(response.Headers, response.StatusCode, responseBody);
            }
            else
            {
				var responseBody = await response.Content.ReadAsStringAsync();
				throw new HttpException(response.StatusCode, response.Headers, responseBody);
            }
        }
    }
}
