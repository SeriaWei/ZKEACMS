/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

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