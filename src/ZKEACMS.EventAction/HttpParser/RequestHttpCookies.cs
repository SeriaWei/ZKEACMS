using Easy.Extend;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;

namespace ZKEACMS.EventAction.HttpParser
{
    class RequestHttpCookies
    {
        private static Regex _cookieMatcher = new Regex(@"Cookie:(?<Cookie>(.+))", RegexOptions.Singleline | RegexOptions.Compiled);
        public Dictionary<string, string> Cookies = new Dictionary<string, string>();
        public RequestHttpCookies(string[] lines)
        {
            var cookieLine = ExtractCookiesLine(lines);
            PopulateParsedCookies(cookieLine);
        }

        private string ExtractCookiesLine(string[] lines)
        {
            var cookieIndex = Array.FindLastIndex(lines, l => l.StartsWith("Cookie"));

            return cookieIndex > 0 ? lines[cookieIndex] : null;
        }

        private void PopulateParsedCookies(string cookiesLine)
        {
            if (string.IsNullOrEmpty(cookiesLine)) return;

            var matches = _cookieMatcher.Match(cookiesLine);
            var cookies = matches.Groups["Cookie"].ToString().Trim().Split(';');

            if (cookies?.Length < 1 || cookies.Contains(""))
            {
                return;
            }

            foreach (var cookie in cookies)
            {
                var cookieArray = cookie.Split('=');
                if (cookieArray.Length != 2) continue;

                var key = cookieArray[0].Trim();
                var value = cookieArray[1].Trim();
                if (value.IsNullOrWhiteSpace()) continue;

                Cookies[key] = value;
            }
        }
    }
}
