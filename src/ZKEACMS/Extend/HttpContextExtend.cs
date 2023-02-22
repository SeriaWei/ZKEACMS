/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.Layout;
using Microsoft.AspNetCore.Http;

namespace ZKEACMS
{
    public static class HttpContextExtend
    {
        public static string GetUrlWithHost(this HttpContext httpContext, string path)
        {
            return $"{httpContext.Request.Scheme}://{httpContext.Request.Host}{path}";
        }
    }
}
