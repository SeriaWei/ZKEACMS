using Easy;
using Easy.Extend;
using Microsoft.AspNetCore.Html;
using System;
using System.Collections.Generic;
using System.Text;
using ZKEACMS.Common.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Service
{
    public class HeadWidgetService : SimpleWidgetService<HeadWidget>
    {
        public HeadWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext) :
            base(widgetBasePartService, applicationContext, dbContext)
        {
        }

        public override object Display(WidgetDisplayContext widgetDisplayContext)
        {
            HtmlContentBuilder htmlContentBuilder = new HtmlContentBuilder();
            htmlContentBuilder.AppendHtmlLine("<!-- head:{0} -->".FormatWith(widgetDisplayContext.Widget.ID));
            htmlContentBuilder.AppendHtmlLine((widgetDisplayContext.Widget as HeadWidget).Content);
            htmlContentBuilder.AppendHtmlLine("<!-- end -->");
            ApplicationContext.As<CMSApplicationContext>().HeaderPart.Add(htmlContentBuilder);
            return base.Display(widgetDisplayContext);
        }
    }
}
