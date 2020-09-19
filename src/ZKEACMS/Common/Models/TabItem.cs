using Easy.MetaData;
using Easy.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ZKEACMS.Common.Models
{
    public class TabItem : EditorEntity
    {
    }
    class TabItemMetaData : ViewMetaData<TabItem>
    {
        protected override void ViewConfigure()
        {
            ViewConfig(m => m.Description).AsTextArea().AddClass(StringKeys.DynamicHtmlEditorClass);
        }
    }

}
