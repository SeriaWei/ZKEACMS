using Easy.MetaData;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Models
{
    [ViewConfigure(typeof(MessageBoxWidgetMetaData))]
    public class MessageBoxWidget : SimpleWidgetBase
    {
    }
    class MessageBoxWidgetMetaData : WidgetMetaData<MessageBoxWidget>
    {

    }
}