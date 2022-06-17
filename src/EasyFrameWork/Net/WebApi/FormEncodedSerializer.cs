/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;

namespace Easy.Net.WebApi
{
    public class FormEncodedSerializer : IRequestSerializer
    {
        public string GetContentTypeRegexPattern()
        {
            return MimeContentType.Form;
        }

        public object DeserializeResponse(HttpContent content, Type responseType)
        {
            throw new IOException($"Unable to deserialize Content-Type: {this.GetContentTypeRegexPattern()}.");
        }

        public HttpContent SerializeRequest(HttpRequest request)
        {
            if (!(request.Body is IEnumerable<KeyValuePair<string, string>>))
            {
                throw new IOException("Request requestBody must be IEnumerable<KeyValuePair<string, string>> when Content-Type is application/x-www-form-urlencoded");
            }

            return new FormUrlEncodedContent(request.Body as IEnumerable<KeyValuePair<string, string>>);
        }
    }
}
