/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Net.Http;

namespace Easy.Net.WebApi
{
    public class TextSerializer : IRequestSerializer
    {

        public object DeserializeResponse(HttpContent content, Type responseType)
        {
            return content.ReadAsStringAsync().Result;
        }

        public string GetContentTypeRegexPattern()
        {
            return MimeContentType.TextRegex;
        }

        public HttpContent SerializeRequest(HttpRequest request)
        {
            return new StringContent(request.Body.ToString());
        }
    }
}
