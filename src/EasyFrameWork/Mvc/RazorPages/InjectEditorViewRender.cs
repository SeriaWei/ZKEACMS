/* http://www.zkea.net/ 
 * Copyright 2020 ZKEASOFT 
 * http://www.zkea.net/licenses */

using Microsoft.AspNetCore.Html;
using Microsoft.AspNetCore.Mvc.Razor;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Text;
using System.Text.Encodings.Web;

namespace Easy.Mvc.RazorPages
{
    public class InjectEditorViewRender : IDisposable
    {
        private readonly RazorPage _page;
        private readonly IHtmlHelper _htmlHelper;
        private readonly string _template;
        public InjectEditorViewRender(RazorPage razorPage, IHtmlHelper htmlHelper, string templateName)
        {
            _page = razorPage;
            _htmlHelper = htmlHelper;
            _template = templateName;
            _page.StartTagHelperWritingScope(_page.HtmlEncoder);
        }
        public void Dispose()
        {
            string content = _page.EndTagHelperWritingScope().GetContent();
            IHtmlContent viewResult = _htmlHelper.Editor(string.Empty, _template, new { InjectedContent = new HtmlString(content) });
            _page.Write(viewResult);
        }
    }
}
