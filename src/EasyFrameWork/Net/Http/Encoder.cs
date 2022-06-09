/* http://www.zkea.net/ 
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

namespace Easy.Net.Http
{
    public class Encoder
    {
        private List<ISerializer> _serializers;

        public Encoder()
        {
            _serializers = new List<ISerializer>();
            RegisterSerializer(new JsonSerializer());
            RegisterSerializer(new TextSerializer());
            RegisterSerializer(new MultipartSerializer());
            RegisterSerializer(new FormEncodedSerializer());
        }

        public void RegisterSerializer(ISerializer serializer)
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

            ISerializer serializer = GetSerializer(request.ContentType);
            if (serializer == null)
            {
                throw new IOException($"Unable to serialize request with Content-Type {request.ContentType}. Supported encodings are {GetSupportedContentTypes()}");
            }

            var content = serializer.Encode(request);

            if ("gzip".Equals(request.ContentEncoding))
            {
                var source = content.ReadAsStringAsync().Result;
                content = new ByteArrayContent(Gzip(source));
            }

            return content;
        }

        public object DeserializeResponse(HttpContent content, Type responseType)
        {
            if (content.Headers.ContentType == null)
            {
                throw new IOException("HTTP response did not have content-type header set");
            }
            var contentType = content.Headers.ContentType.ToString();
            contentType = contentType.ToLower();
            ISerializer serializer = GetSerializer(contentType);
            if (serializer == null)
            {
                throw new IOException($"Unable to deserialize response with Content-Type {contentType}. Supported encodings are {GetSupportedContentTypes()}");
            }

            var contentEncoding = content.Headers.ContentEncoding.FirstOrDefault();

            if ("gzip".Equals(contentEncoding))
            {
                var buf = content.ReadAsByteArrayAsync().Result;
                content = new StringContent(Gunzip(buf), Encoding.UTF8);
            }

            return serializer.Decode(content, responseType);
        }

        private ISerializer GetSerializer(string contentType)
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

        private static byte[] Gzip(string source)
        {
            var bytes = Encoding.UTF8.GetBytes(source);

            using (var msi = new MemoryStream(bytes))
            using (var mso = new MemoryStream())
            {
                using (var gs = new GZipStream(mso, CompressionMode.Compress))
                {
                    msi.CopyTo(gs);
                }

                return mso.ToArray();
            }
        }

        private static string Gunzip(byte[] source)
        {
            using (var msi = new MemoryStream(source))
            using (var mso = new MemoryStream())
            {
                using (var gs = new GZipStream(msi, CompressionMode.Decompress))
                {
                    CopyTo(gs, mso);
                }

                return Encoding.UTF8.GetString(mso.ToArray());
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
