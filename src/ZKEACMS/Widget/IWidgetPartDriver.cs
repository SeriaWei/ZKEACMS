/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.Zip;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;

namespace ZKEACMS.Widget
{
    public interface IWidgetPartDriver : IDisposable
    {
        bool IsNeedNotifyChange { get; set; }
        void AddWidget(WidgetBase widget);
        void DeleteWidget(string widgetId);
        void UpdateWidget(WidgetBase widget);
        void Publish(WidgetBase widget);
        WidgetBase GetWidget(WidgetBase widget);
        WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext);
        WidgetPackage PackWidget(WidgetBase widget);
        void InstallWidget(WidgetPackage pack);
    }

}
