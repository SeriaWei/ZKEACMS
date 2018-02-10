/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using Easy.RepositoryPattern;
using System;
using System.Collections.Generic;

namespace ZKEACMS.WidgetTemplate
{
    public interface IWidgetTemplateService
    {
        WidgetTemplateEntity Get(string Id);
        IList<WidgetTemplateEntity> Get();
        IList<WidgetTemplateEntity> Get(Func<WidgetTemplateEntity, bool> filter);
    }
}