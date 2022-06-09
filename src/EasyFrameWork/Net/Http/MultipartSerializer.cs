/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Collections;
using System.Collections.Generic;

namespace Easy.Net.Http
{
    public class MultipartSerializer : ISerializer
    {
        public string GetContentTypeRegexPattern()
        {
            return "^multipart/.*$";
        }

        public object Decode(HttpContent content, Type responseType)
        {
            throw new IOException("Unable to deserialize Content-Type: multipart/form-data.");
        }

        private string GetMimeMapping(string filename)
        {
            switch (Path.GetExtension(filename))
            {
                case ".jpeg":
                    return "image/jpeg";
                case ".jpg":
                    return "image/jpeg";
                case ".gif":
                    return "image/gif";
                case ".png":
                    return "image/png";
                case ".pdf":
                    return "application/pdf";
                default:
                    return "application/octet-stream";
            }
        }

        public HttpContent Encode(HttpRequest request)
        {
            if (!(request.Body is IDictionary))
            {
                throw new IOException("Request requestBody must be Map<String, Object> when Content-Type is multipart/*");
            }

            var boundary = "CustomBoundary8d0f01e6b3b5daf";
            MultipartFormDataContent form = new MultipartFormDataContent(boundary);
            var body = (Dictionary<string, object>)request.Body;

            foreach (KeyValuePair<string, object> item in body)
            {
                if (item.Value is FileStream)
                {
                    var file = (FileStream)item.Value;
                    try {
                        MemoryStream memoryStream = new MemoryStream();
                        file.CopyTo(memoryStream);
                        var fileContent = new ByteArrayContent(memoryStream.ToArray());
                        var fileName = Path.GetFileName(file.Name);
                        // This is necessary to quote values since the web server is picky; .NET normally does not quote
                        fileContent.Headers.Add("Content-Disposition", "form-data; name=\"" + (string)item.Key + "\"; filename=\"" + fileName + "\"");
                        string mimeType = GetMimeMapping(fileName);
                        fileContent.Headers.Add("Content-Type", mimeType);

                        form.Add(fileContent, (string)item.Key);
                    } finally {
                        file.Dispose();
                    }
                }
                else if (item.Value is HttpContent)
                {
                    form.Add((HttpContent)item.Value, (string)item.Key);
                }
                else
                {
                    form.Add(new StringContent((string)item.Value), (string)item.Key);
                }
            }

            // This is necessary to avoid quoting the boundary value since the web server is picky; .NET may add quotes
            form.Headers.Remove("Content-Type");
            form.Headers.TryAddWithoutValidation("Content-Type", "multipart/form-data; boundary=" + boundary);
            return form;
        }
    }
}
