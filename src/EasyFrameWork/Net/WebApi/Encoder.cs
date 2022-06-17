﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.IO;
using System.IO.Compression;
using System.Text;
using System.Text.RegularExpressions;
using System.Net.Http;
using System.Collections.Generic;
using System.Linq;

namespace Easy.Net.WebApi
{
    public class Encoder
    {
        private List<IRequestSerializer> _serializers;

        public Encoder()
        {
            _serializers = new List<IRequestSerializer>();
            AddSerializer(new JsonSerializer());
            AddSerializer(new TextSerializer());
            AddSerializer(new MultipartSerializer());
            AddSerializer(new FormEncodedSerializer());
        }

        public void AddSerializer(IRequestSerializer serializer)
        {
            if (serializer != null)
            {
                _serializers.Add(serializer);
            }
        }

        public HttpContent SerializeRequest(HttpRequest request)
        {
            if (request.ContentType == null)
            {
                throw new IOException("HttpRequest did not have content-type header set");
            }

            request.ContentType = request.ContentType.ToLower();

            IRequestSerializer serializer = GetSerializer(request.ContentType);
            if (serializer == null)
            {
                throw new IOException($"Unable to serialize request with Content-Type {request.ContentType}. Supported encodings are {GetSupportedContentTypes()}");
            }

            return serializer.SerializeRequest(request);
        }

        public object DeserializeResponse(HttpContent content, Type responseType)
        {
            if (content.Headers.ContentType == null)
            {
                throw new IOException("HTTP response did not have content-type header set");
            }
            var contentType = content.Headers.ContentType.ToString();
            contentType = contentType.ToLower();
            IRequestSerializer serializer = GetSerializer(contentType);            

            bool isZip = content.Headers.ContentEncoding.Contains("gzip", StringComparer.OrdinalIgnoreCase);

            if (isZip)
            {
                var buff = content.ReadAsByteArrayAsync().Result;
                content = new ByteArrayContent(UnZip(buff));
            }
            if (serializer != null)
            {
                return serializer.DeserializeResponse(content, responseType);
            }
            return content.ReadAsByteArrayAsync().Result;
        }

        private IRequestSerializer GetSerializer(string contentType)
        {
            foreach (var serializer in _serializers)
            {
                Regex pattern = new Regex(serializer.GetContentTypeRegexPattern());
                if (pattern.Match(contentType).Success)
                {
                    return serializer;
                }
            }

            return null;
        }

        private string GetSupportedContentTypes()
        {
            List<string> contentTypes = new List<string>();
            foreach (var serializer in this._serializers)
            {
                contentTypes.Add(serializer.GetContentTypeRegexPattern());
            }

            return String.Join(", ", contentTypes);
        }


        private static byte[] UnZip(byte[] source)
        {
            using (var msi = new MemoryStream(source))
            using (var mso = new MemoryStream())
            {
                using (var gs = new GZipStream(msi, CompressionMode.Decompress))
                {
                    CopyTo(gs, mso);
                }

                return mso.ToArray();
            }
        }

        private static void CopyTo(Stream src, Stream dest)
        {
            byte[] bytes = new byte[4096];

            int cnt;

            while ((cnt = src.Read(bytes, 0, bytes.Length)) != 0)
            {
                dest.Write(bytes, 0, cnt);
            }
        }
    }
}
