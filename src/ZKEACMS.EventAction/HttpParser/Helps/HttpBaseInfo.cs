/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace ZKEACMS.EventAction.HttpParser.Helps
{
    partial class HttpBaseInfo
    {
        private static readonly HashSet<string> validHttpVerbs = new HashSet<string> { "GET", "POST", "HEAD", "PUT", "DELETE", "MOVE", "TRACE", "CONNECT", "OPTIONS" };

        public string Method { get; set; }
        public string Url { get; set; }
        public string HttpVersion { get; set; } = "HTTP/1.1";

        public HttpBaseInfo(string requestDefinition)
        {
            var definitionArray = requestDefinition.Split(' ', StringSplitOptions.RemoveEmptyEntries);

            ValidateRequestLine(definitionArray);
            SetHttpMethod(definitionArray[0]);
            SetUrl(definitionArray[1]);

            if (definitionArray.Length == 3)
            {
                SetHttpVersion(definitionArray[2]);
            }
        }

        private void ValidateRequestLine(string[] definitionArray)
        {
            if (definitionArray.Length < 2)
                throw new ParseHttpRequestException("Request Line is not in a valid format", "ValidateRequestLine", string.Join(" ", definitionArray));
        }

        private void SetHttpMethod(string method)
        {
            method = method.ToUpper();

            if (!validHttpVerbs.Contains(method))
                throw new ParseHttpRequestException("Not a valid HTTP Verb", "SetHttpMethod", method);

            Method = method;
        }

        private void SetUrl(string url)
        {
            if (!IsValidUri(url))
                throw new ParseHttpRequestException("URL is not in a valid format", "SetUrl", url);

            Url = url;
        }

        private static bool IsValidUri(string url)
        {
            return Uri.TryCreate(url, UriKind.Absolute, out Uri uriResult) && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);
        }

        private void SetHttpVersion(string version)
        {
            if (!RegexHttpVersionValidate().IsMatch(version)) return;

            HttpVersion = version.Trim();
        }

        [GeneratedRegex("HTTP/\\d.\\d", RegexOptions.Compiled)]
        private static partial Regex RegexHttpVersionValidate();
    }
}
