/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */


using System;
using System.Net.Http;
using System.Net.Http.Headers;

namespace Easy.Net.WebApi
{
	public interface IRequestSerializer
    {
        string GetContentTypeRegexPattern();
        HttpContent SerializeRequest(HttpRequest request);
        object DeserializeResponse(HttpContent content, Type responseType);
    }
}
