using Easy.MetaData;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Models
{
    [ViewConfigure(typeof(MessageWidgetMetaData))]
    public class MessageWidget : SimpleWidgetBase
    {
    }
    class MessageWidgetMetaData : WidgetMetaData<MessageWidget>
    {

    }
}