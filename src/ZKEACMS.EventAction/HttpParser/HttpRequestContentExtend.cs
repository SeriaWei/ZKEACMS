using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.EventAction.HttpParser
{
    public static class HttpRequestContentExtend
    {
        public static HttpRequestMessage ConvertToHttpRequestMessage(this HttpRequestContent httpRequestContent)
        {
            const string ContentTypeName = "Content-Type";
            const string DefaultContentTypeValue = "application/json";
            var httpRequest = new HttpRequestMessage
            {
                RequestUri = new Uri(httpRequestContent.Url),
                Method = new HttpMethod(httpRequestContent.Method),
                Version = new System.Version(httpRequestContent.HttpVersion.Substring(5))
            };
            string contentType = null;
            foreach (var item in httpRequestContent.Headers)
            {
                if (item.Key.Equals(ContentTypeName, StringComparison.OrdinalIgnoreCase))
                {
                    contentType = item.Value;
                    continue;
                }

                httpRequest.Headers.Add(item.Key, item.Value);
            }
            if (httpRequestContent.Cookies != null && httpRequestContent.Cookies.Count > 0)
            {
                httpRequest.Headers.Add("Cookie", string.Join("; ", httpRequestContent.Cookies.Select(cookie => $"{cookie.Key}={cookie.Value}")));
            }
            if (httpRequestContent.RequestBody.IsNotNullAndWhiteSpace())
            {
                httpRequest.Content = new StringContent(httpRequestContent.RequestBody, new MediaTypeHeaderValue(contentType ?? DefaultContentTypeValue));
            }

            return httpRequest;
        }
    }
}
