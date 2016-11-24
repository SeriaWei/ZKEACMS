/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Zip;
using Microsoft.AspNetCore.Http;
using System;

namespace ZKEACMS.Widget
{
    public interface IWidgetPartDriver : IDisposable
    {
        void AddWidget(WidgetBase widget);
        void DeleteWidget(string widgetId);
        void UpdateWidget(WidgetBase widget);
        void Publish(WidgetBase widget);
        WidgetBase GetWidget(WidgetBase widget);
        WidgetPart Display(WidgetBase widget, HttpContext httpContext);
        ZipFile PackWidget(WidgetBase widget);
        WidgetBase UnPackWidget(ZipFileInfoCollection pack);
    }

}
