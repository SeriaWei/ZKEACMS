﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Collections;
using System.Collections.Generic;

namespace Easy.Net.WebApi
{
    public class MultipartSerializer : IRequestSerializer
    {
        public string GetContentTypeRegexPattern()
        {
            return MimeContentType.MultipartRegex;
        }

        public object DeserializeResponse(HttpContent content, Type responseType)
        {
            return content.ReadAsByteArrayAsync().Result;
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

        public HttpContent SerializeRequest(HttpRequest request)
        {
            if (!(request.Body is IEnumerable<KeyValuePair<string, object>>))
            {
                throw new IOException("Request requestBody must be IEnumerable<KeyValuePair<string, object>> when Content-Type is multipart/*");
            }

            var boundary = "CustomBoundary8d0f01e6b3b5daf";
            MultipartFormDataContent form = new MultipartFormDataContent(boundary);
            var body = request.Body as IEnumerable<KeyValuePair<string, object>>;

            foreach (KeyValuePair<string, object> item in body)
            {
                if (item.Value is FileStream)
                {
                    var file = (FileStream)item.Value;
                    try
                    {
                        MemoryStream memoryStream = new MemoryStream();
                        file.CopyTo(memoryStream);
                        var fileContent = new ByteArrayContent(memoryStream.ToArray());
                        var fileName = Path.GetFileName(file.Name);
                        // This is necessary to quote values since the web server is picky; .NET normally does not quote
                        fileContent.Headers.Add("Content-Disposition", "form-data; name=\"" + (string)item.Key + "\"; filename=\"" + fileName + "\"");
                        string mimeType = GetMimeMapping(fileName);
                        fileContent.Headers.Add("Content-Type", mimeType);

                        form.Add(fileContent, (string)item.Key);
                    }
                    finally
                    {
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
