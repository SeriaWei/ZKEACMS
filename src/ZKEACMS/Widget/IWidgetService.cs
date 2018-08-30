/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System.Collections.Generic;
using System.IO;
using Easy.RepositoryPattern;
using ZKEACMS.Page;
using Microsoft.AspNetCore.Http;
using System;
using Microsoft.AspNetCore.Mvc;

namespace ZKEACMS.Widget
{
    public interface IWidgetBasePartService : IService<WidgetBasePart>
    {
        bool IsNeedNotifyChange { get; set; }
        IEnumerable<WidgetBase> GetByLayoutId(string layoutId);
        IEnumerable<WidgetBase> GetByPageId(string pageId);
        IEnumerable<WidgetBase> GetAllByPage(PageEntity page);
        IEnumerable<WidgetBase> GetAllByRule(int[] roleId, bool formCache = false);
        WidgetViewModelPart ApplyTemplate(WidgetBase widget, ActionContext actionContext);
        void RemoveCache(string pageId);
        void ClearCache();
    }
}