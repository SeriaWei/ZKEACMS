using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace Easy.Mvc.ViewResult
{
    public class HttpForbiddenResult : StatusCodeResult
    {
        public HttpForbiddenResult() : base((int)HttpStatusCode.Forbidden)
        {
        }
    }
}
