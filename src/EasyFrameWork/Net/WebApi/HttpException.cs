/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.IO;
using System.Net.Http;
using System.Net;
using System.Net.Http.Headers;

namespace Easy.Net.WebApi
{
    public class HttpException : IOException
    {
        public HttpStatusCode StatusCode { get; }
        public HttpHeaders Headers { get; }
        public string ResponseData { get; }
        public HttpException(HttpStatusCode statusCode, HttpHeaders headers, string message) : base(message)
        {
            StatusCode = statusCode;
            Headers = headers;
            ResponseData = message;
        }
    }
}
