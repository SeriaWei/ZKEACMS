/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Net.Http;

namespace Easy.Net.Http
{
    public class HttpRequest : HttpRequestMessage
    {
        public string Path { get; set; }
        public object Body { get; set; }
        public string ContentType { get; set; }
        public string ContentEncoding { get; set; }
        public Type ResponseType { get; }
        public HttpRequest(string path, HttpMethod method, Type responseType)
        {
            this.Path = path;
            this.ResponseType = responseType;
            base.Method = method;
            this.ContentEncoding = "identity";
        }

        public HttpRequest(string path, HttpMethod method) : this(path, method, typeof(void))
        {
        }

        public T Clone<T>() where T : HttpRequest
        {
            return (T)this.MemberwiseClone();
        }
    }
}
