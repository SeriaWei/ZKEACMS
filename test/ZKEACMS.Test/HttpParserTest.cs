/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System.IO;
using System.Net.Http;
using ZKEACMS.EventAction.HttpParser;

namespace ZKEACMS.Test
{
    [TestClass]
    public class HttpParserTest
    {
        [TestMethod]
        public void ParseHttpRequest()
        {
            var message = HttpRequestContent.Parse(@"GET http://www.zkea.net/").ConvertToHttpRequestMessage();
        }
    }
}
