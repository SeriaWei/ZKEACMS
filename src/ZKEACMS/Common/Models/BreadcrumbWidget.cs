/* http://www.zkea.net/ Copyright 2016 ZKEASOFT http://www.zkea.net/licenses */
using System;
using Easy.MetaData;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Common.Models
{
    [ViewConfigure(typeof(BreadcrumbWidgetMetaData))]
    public class BreadcrumbWidget : SimpleWidgetBase
    {
    }

    class BreadcrumbWidgetMetaData : WidgetMetaData<BreadcrumbWidget>
    {

    }
}