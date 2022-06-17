﻿/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System;
using System.Net.Http;

namespace Easy.Net.WebApi
{
    public class HttpRequest : HttpRequestMessage
    {
        public object Body { get; set; }
        public string ContentType { get; set; }
        public Type ResponseType { get; }
        public HttpRequest(string path, HttpMethod method, Type responseType) : base(method, path)
        {
            this.ResponseType = responseType;
            base.Method = method;
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
