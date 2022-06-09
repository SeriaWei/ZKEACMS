/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;

namespace Easy.Net.Http
{
    public class FormEncodedSerializer : ISerializer
    {
        public string GetContentTypeRegexPattern()
        {
            return "application/x-www-form-urlencoded";
        }

        public object Decode(HttpContent content, Type responseType)
        {
            throw new IOException($"Unable to deserialize Content-Type: {this.GetContentTypeRegexPattern()}.");
        }

        public HttpContent Encode(HttpRequest request)
        {
            if (!(request.Body is IDictionary))
            {
                throw new IOException("Request requestBody must be Map<string, string> when Content-Type is application/x-www-form-urlencoded");
            }

            return new FormUrlEncodedContent((Dictionary<string, string>)request.Body);
        }
    }
}
