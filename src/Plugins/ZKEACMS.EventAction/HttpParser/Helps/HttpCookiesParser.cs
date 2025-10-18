/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace ZKEACMS.EventAction.HttpParser.Helps
{
    class HttpCookiesParser
    {
        public Dictionary<string, string> Cookies = new Dictionary<string, string>();
        public HttpCookiesParser(string[] lines)
        {
            PopulateCookies(lines);
        }


        private void PopulateCookies(string[] lines)
        {
            foreach (var line in lines)
            {
                if (!line.StartsWith("Cookie:", StringComparison.OrdinalIgnoreCase)) continue;

                string cookieString = line.Split(':')[1];
                var cookieArray = cookieString.Split(';');
                foreach (var cookieKeyValue in cookieArray)
                {
                    var keyValue = cookieKeyValue.Split('=', 2);

                    if (keyValue.Length != 2) continue;

                    var key = keyValue[0].Trim();
                    var value = keyValue[1].Trim();

                    Cookies[key] = value;
                }
            }
        }
    }
}
