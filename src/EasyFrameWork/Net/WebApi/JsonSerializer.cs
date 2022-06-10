/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Net.Http;
using System.Runtime.Serialization.Json;
using System.IO;

namespace Easy.Net.WebApi
{
    public class JsonSerializer : ISerializer
    {
        public string GetContentTypeRegexPattern()
        {
            return MimeContentType.Json;
        }

        public object Decode(HttpContent content, Type responseType)
        {
            var jsonSerializer = new DataContractJsonSerializer(responseType);
            var jsonString = content.ReadAsStringAsync().Result;

            using (var ms = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(jsonString)))
            {
                return jsonSerializer.ReadObject(ms);
            }
        }

        public HttpContent Encode(HttpRequest request)
        {
            var jsonSerializer = new DataContractJsonSerializer(request.Body.GetType());

            using (var ms = new MemoryStream())
            {
                jsonSerializer.WriteObject(ms, request.Body);
                ms.Position = 0;
                using (var sr = new StreamReader(ms))
                {
                    return new StringContent(sr.ReadToEnd(), System.Text.Encoding.UTF8, MimeContentType.Json);
                }
            }
        }
    }
}
