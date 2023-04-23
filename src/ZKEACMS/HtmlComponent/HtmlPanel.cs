using Easy.Extend;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Encodings.Web;
using System.Threading.Tasks;

namespace ZKEACMS.HtmlComponent
{
    public class HtmlPanel : IDisposable
    {
        private readonly TextWriter _writer;
        private readonly bool _wrapWithPanel;
        public HtmlPanel(TextWriter textWriter, string title) : this(textWriter, title, null, null)
        {

        }
        public HtmlPanel(TextWriter textWriter, string title, string link, string linkText)
        {
            _writer = textWriter;
            _wrapWithPanel = title.IsNotNullAndWhiteSpace() || link.IsNotNullAndWhiteSpace();

            if (!_wrapWithPanel) return;

            _writer.Write("<div class=\"panel panel-default\"><div class=\"panel-heading clearfix\">");
            if (title.IsNotNullAndWhiteSpace())
            {
                _writer.Write($"<div class=\"pull-left\">{title}</div>");
            }
            if (link.IsNotNullAndWhiteSpace())
            {
                _writer.Write($"<div class=\"pull-right\">");
                TagBuilder linkBuilder = new TagBuilder("a");
                linkBuilder.MergeAttribute("href", link);
                linkBuilder.RenderStartTag().WriteTo(_writer, HtmlEncoder.Default);
                _writer.Write(linkText ?? string.Empty);
                linkBuilder.RenderEndTag().WriteTo(_writer, HtmlEncoder.Default);
                _writer.Write("</div>");
            }
            _writer.Write("</div><div class=\"panel-body\">");
        }

        public void Dispose()
        {
            if (_wrapWithPanel)
            {
                _writer.Write("</div></div>");
            }
        }
    }
}
