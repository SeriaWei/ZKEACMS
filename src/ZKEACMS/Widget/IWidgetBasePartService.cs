/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using System.Collections.Generic;
using System.IO;
using Easy.RepositoryPattern;
using ZKEACMS.Page;
using Microsoft.AspNetCore.Http;
using System;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Event;

namespace ZKEACMS.Widget
{
    public interface IWidgetBasePartService : IService<WidgetBasePart>
    {
        IEventManager EventManager { get; }
        IEnumerable<WidgetBase> GetByLayoutId(string layoutId);
        IEnumerable<WidgetBase> GetByPageId(string pageId);
        IEnumerable<WidgetBase> GetAllByPage(PageEntity page);
        IEnumerable<WidgetBase> GetAllByRule(int[] roleId, bool formCache = false);
        WidgetViewModelPart ApplyTemplate(Layout.LayoutEntity pageLayout, WidgetBase widget, ActionContext actionContext);
        void RemoveCache(string pageId);
        void ClearCache();
        IEnumerable<TWidget> GetAllWidgets<TWidgetService, TWidget>() 
            where TWidgetService : SimpleWidgetService<TWidget>
            where TWidget : SimpleWidgetBase, new();

        void UpdateWidgets<TWidget>(params TWidget[] widgets) where TWidget : SimpleWidgetBase, new();
    }
}