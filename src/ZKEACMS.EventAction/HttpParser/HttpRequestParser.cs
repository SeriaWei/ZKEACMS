using ZKEACMS.EventAction.HttpParser;
using System;

namespace ZKEACMS.EventAction.HttpParser
{
    public partial class HttpRequest
    {
        public static HttpRequest ParseHttpRequest(string raw)
        {
            var lines = SplitLines(raw);
            var requestHttp = new RequestHttpBaseInfo(lines[0]);
            var requestHeaders = new RequestHttpHeaders(lines);
            var requestCookies = new RequestHttpCookies(lines);
            var requestBody = new RequestHttpBody(lines);

            var parsed = new HttpRequest()
            {
                Url = requestHttp.Url,
                Method = requestHttp.Method,
                HttpVersion = requestHttp.HttpVersion,
                Headers = requestHeaders.Headers,
                Cookies = requestCookies.Cookies,
                RequestBody = requestBody.Body
            };
            return parsed;

        }

        private static string[] SplitLines(string raw)
        {
            return raw
                .TrimEnd('\r', '\n')
                .Split(new[] { "\\n", "\n", "\r\n" }, StringSplitOptions.None);
        }
    }
}
