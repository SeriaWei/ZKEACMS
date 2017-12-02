using Easy.MetaData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Models
{
    [ViewConfigure(typeof(CommentsWidgetMetaData))]
    public class CommentsWidget : SimpleWidgetBase
    {
    }

    class CommentsWidgetMetaData : WidgetMetaData<CommentsWidget>
    {

    }
}
