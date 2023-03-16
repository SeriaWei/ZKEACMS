/* http://www.zkea.net/ 
 * Copyright 2018 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.VisualStudio.TestTools.UnitTesting;
using OpenQA.Selenium;
using OpenQA.Selenium.Support.UI;
using System.IO;
using System.Net.Http;
using YamlDotNet.Serialization.NamingConventions;
using YamlDotNet.Serialization;
using ZKEACMS.EventAction.HttpParser;
using ZKEACMS.EventAction.ActionExecutor;
using Easy.Serializer;

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

        [TestMethod]
        public void DeserializeEventAction()
        {

            var eventAction = YamlConverter.Deserialize<EventActionContent>(@"name: event jobs
condition: Id == 1

actions:
- name: send email notification
  uses: actions/email
  with:
    subject: welcome to china
    to: wayne@king.com
    cc: job@king.com
    bcc: hello@kingston.com
    bodyTemplate: 12
    body: Welcome
- name: web hook
  uses: actions/http
  with:
    request: |
      POST http://www.zkea.net
      Content-Type: application/json
      Authorization: Bearer {{token}}

      {
        ""userID"": ""admin"",
        ""passWord"": ""admin""
      }
    requestTemplate: 13");
        }
    }
}
