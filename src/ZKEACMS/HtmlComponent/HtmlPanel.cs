using Easy.Extend;
using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ZKEACMS.HtmlComponent
{
    public class HtmlPanel : IDisposable
    {
        private readonly ViewContext _viewContext;
        private readonly bool _wrapWithPanel;
        public HtmlPanel(ViewContext viewContext, string title) : this(viewContext, title, null, null)
        {

        }
        public HtmlPanel(ViewContext viewContext, string title, string link, string linkText)
        {
            _viewContext = viewContext;
            _wrapWithPanel = title.IsNotNullAndWhiteSpace() || link.IsNotNullAndWhiteSpace();

            if (!_wrapWithPanel) return;

            _viewContext.Writer.Write("<div class=\"panel panel-default\"><div class=\"panel-heading clearfix\">");
            if (title.IsNotNullAndWhiteSpace())
            {
                _viewContext.Writer.Write($"<div class=\"pull-left\">{title}</div>");
            }
            if (link.IsNotNullAndWhiteSpace())
            {
                _viewContext.Writer.Write($"<div class=\"pull-right\">");
                TagBuilder linkBuilder = new TagBuilder("a");
                linkBuilder.MergeAttribute("href", link);
                _viewContext.Writer.Write(linkBuilder.RenderStartTag());
                _viewContext.Writer.Write(linkText ?? string.Empty);
                _viewContext.Writer.Write(linkBuilder.RenderEndTag());
                _viewContext.Writer.Write("</div>");
            }
            _viewContext.Writer.Write("</div><div class=\"panel-body\">");
        }

        public void Dispose()
        {
            if (_wrapWithPanel)
            {
                _viewContext.Writer.Write("</div></div>");
            }
        }
    }
}
