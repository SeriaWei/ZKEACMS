using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;

namespace ZKEACMS.EventAction.HttpParser
{
    public partial class HttpRequest
    {
        public string Url { get; set; }
        public string Method { get; set; }
        public string HttpVersion { get; set; }
        public Dictionary<string, string> Headers { get; set; }
        public Dictionary<string, string> Cookies { get; set; }
        public string RequestBody { get; set; }

        public HttpRequestMessage ToHttpRequestMessage()
        {
            const string ContentType = "Content-Type";

            var httpRequest = new HttpRequestMessage
            {
                RequestUri = new Uri(Url),
                Method = new HttpMethod(Method),
                Version = new System.Version(HttpVersion.Substring(5))
            };
            string contentType = null;
            foreach (var item in Headers)
            {
                if (item.Key.Equals(ContentType, StringComparison.OrdinalIgnoreCase))
                {
                    contentType = item.Value;
                    continue;
                }

                httpRequest.Headers.Add(item.Key, item.Value);
            }
            if (Cookies != null && Cookies.Count > 0)
            {
                httpRequest.Headers.Add("Cookie", string.Join("; ", Cookies.Select(cookie => $"{cookie.Key}={cookie.Value}")));
            }
            if (contentType != null)
            {
                httpRequest.Content = new StringContent(RequestBody, new System.Net.Http.Headers.MediaTypeHeaderValue(contentType));
            }
            else
            {
                httpRequest.Content = new StringContent(RequestBody);
            }
            return httpRequest;
        }
        public override string ToString()
        {
            var sb = new StringBuilder($"{Method} {Url} {HttpVersion}{Environment.NewLine}");

            var headersToIgnore = new List<string> { "Cookie" };

            foreach (var header in Headers)
            {
                if (headersToIgnore.Contains(header.Key)) continue;
                sb.Append($"{header.Key}: {header.Value}{Environment.NewLine}");
            }

            if (Cookies?.Count > 0)
            {
                var cookies = string.Join("; ", Cookies.Select(cookie => $"{cookie.Key}={cookie.Value}"));

                sb.Append($"Cookie:{cookies}{Environment.NewLine}");
            }

            if (RequestBody.IsNotNullAndWhiteSpace())
            {
                sb.Append(Environment.NewLine);
                sb.Append(RequestBody);
            }

            return sb.ToString().Trim();
        }
    }
}
