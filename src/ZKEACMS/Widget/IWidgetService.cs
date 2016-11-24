/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.IO;
using Easy.RepositoryPattern;
using ZKEACMS.Page;
using Microsoft.AspNetCore.Http;
using System;

namespace ZKEACMS.Widget
{
    public interface IWidgetService : IService<WidgetBase>
    {
        IEnumerable<WidgetBase> GetByLayoutId(string layoutId);
        IEnumerable<WidgetBase> GetByPageId(string pageId);
        IEnumerable<WidgetBase> GetAllByPageId(IServiceProvider serviceProvider, string pageId);
        IEnumerable<WidgetBase> GetAllByPage(IServiceProvider serviceProvider, PageEntity page);
        WidgetPart ApplyTemplate(WidgetBase widget, HttpContext httpContext);
        MemoryStream PackWidget(string widgetId, HttpContext httpContext);
        WidgetBase InstallPackWidget(Stream stream, HttpContext httpContext);
    }
}