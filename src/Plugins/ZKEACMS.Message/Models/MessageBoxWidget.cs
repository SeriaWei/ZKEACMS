/* http://www.zkea.net/ 
 * Copyright (c) ZKEASOFT. All rights reserved. 
 * http://www.zkea.net/licenses */

using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Models
{
    public class MessageBoxWidget : SimpleWidgetBase
    {
    }
    class MessageBoxWidgetMetaData : WidgetMetaData<MessageBoxWidget>
    {
        protected override void ViewConfigure()
        {
            base.ViewConfigure();
            ViewConfig(m => m.Title).AsHidden();
        }
    }
}