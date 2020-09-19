using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace Easy.Mvc.ViewResult
{
    public class HttpBadRequestResult : StatusCodeResult
    {
        public HttpBadRequestResult() : base((int)HttpStatusCode.BadRequest)
        {
        }
    }
}
