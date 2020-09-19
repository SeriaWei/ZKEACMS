using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using System;
using System.Collections.Generic;
using System.Net;
using System.Text;

namespace Easy.Mvc.ViewResult
{
    public class HttpNotFoundResult : StatusCodeResult
    {
        public HttpNotFoundResult() : base((int)HttpStatusCode.NotFound)
        {
        }
    }
}
