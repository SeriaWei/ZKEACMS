/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Ganss.XSS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Safety
{
    public class DefaultHtmlSanitizer : IHtmlSanitizer
    {
        private static HtmlSanitizer _sanitizer;
        static DefaultHtmlSanitizer()
        {
            _sanitizer = new HtmlSanitizer();
            _sanitizer.AllowedSchemes.Add("mailto");
            _sanitizer.AllowedAttributes.Add("class");
        }

        public string Sanitize(string html)
        {
            return _sanitizer.Sanitize(html);
        }
    }
}
