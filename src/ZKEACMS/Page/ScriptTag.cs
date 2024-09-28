/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Html;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.Page
{
    public class ScriptTag : PageTag
    {
        public ScriptTag()
        {
            Attributes.Add("type", "text/javascript");
        }
        public ScriptTag(string src) : this()
        {
            Attributes.Add("src", src);
        }
        public override string Name => "script";

        public string Type { get { return Attributes["type"]; } set { Attributes["type"] = value; } }

        public IHtmlContent InnerScript { get { return InnerHtml; } set { InnerHtml = value; } }
    }
}
