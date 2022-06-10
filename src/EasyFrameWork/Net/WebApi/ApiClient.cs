/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace Easy.Net.WebApi
{
    public class ApiClient : IDisposable
    {
        private HttpClient _client;
        private List<IInjector> _injectors;

        public ApiClient()
        {
            Encoder = new Encoder();
            _injectors = new List<IInjector>();
            _client = new HttpClient();
            _client.DefaultRequestHeaders.Add("User-Agent", GetUserAgent());
        }
        public ApiClient(ApiEnvironment environment) : this()
        {
            Environment = environment;
            _client.BaseAddress = new Uri(environment.BaseUrl);
        }

        public Encoder Encoder { get; }
        public ApiEnvironment Environment { get; }

        protected virtual string GetUserAgent()
        {
            return "Mozilla/5.0 (Windows NT 10.0; Win64; x64)";
        }
        public void EnableGzip()
        {
            AddInjector(new GzipInjector());
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

        public virtual async Task<HttpResponse> ExecuteAsync<T>(T req) where T : HttpRequest
        {
            T request = PrepareRequest(req);

            var response = await _client.SendAsync(request);

            if (response.IsSuccessStatusCode)
            {
                return DeserializeResponse(request.ResponseType, response);
            }
            else
            {
                var responseBody = await response.Content.ReadAsStringAsync();
                throw new HttpException(response.StatusCode, response.Headers, responseBody);
            }
        }

        private T PrepareRequest<T>(T req) where T : HttpRequest
        {
            var request = req.Clone<T>();

            foreach (var injector in _injectors)
            {
                injector.Inject(request);
            }

            if (request.Body != null)
            {
                request.Content = Encoder.SerializeRequest(request);
            }

            return request;
        }

        private HttpResponse DeserializeResponse(Type responseType, HttpResponseMessage response)
        {
            object responseBody = null;
            if (response.Content.Headers.ContentType != null)
            {
                responseBody = Encoder.DeserializeResponse(response.Content, responseType);
            }
            return new HttpResponse(response.Headers, response.StatusCode, responseBody);
        }

        public virtual HttpResponse Excute<T>(T req) where T : HttpRequest
        {
            T request = PrepareRequest(req);

            var response = _client.Send(request);

            if (response.IsSuccessStatusCode)
            {
                return DeserializeResponse(request.ResponseType, response);
            }
            else
            {
                var stream = response.Content.ReadAsStream();
                var responseBody = string.Empty;
                var encoding = GetResponseEncoding(response.Content);
                using (var sr = new StreamReader(stream, encoding))
                {
                    responseBody = sr.ReadToEnd();
                }
                throw new HttpException(response.StatusCode, response.Headers, responseBody);
            }
        }
        private Encoding GetResponseEncoding(HttpContent content)
        {
            try
            {
                var charset = content?.Headers?.ContentType?.CharSet;
                if (string.IsNullOrEmpty(charset)) return Encoding.UTF8;

                return Encoding.GetEncoding(charset);
            }
            catch
            {
                return Encoding.UTF8;
            }
        }
        public void Dispose()
        {
            _client.Dispose();
        }
    }
}
