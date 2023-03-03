/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System.IO;
using System.Net.Http;

namespace ZKEACMS.Test
{
    [TestClass]
    public class HttpParserTest
    {
        [TestMethod]
        public void ParseHttpRequest()
        {
            var message = ZKEACMS.EventAction.HttpParser.HttpRequest.ParseHttpRequest(@"POST http://localhost:5000/api/account/createtoken
Content-Type: application/json

{
  ""userID"": ""admin"",
  ""passWord"": ""admin""
}").ToHttpRequestMessage();
            var s = new HttpClient().Send(message).Content.ReadAsStringAsync().Result;
        }
    }
}
