using Easy.MetaData;
using ZKEACMS.MetaData;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Models
{
    [ViewConfigure(typeof(MessageWidgetMetaData))]
    public class MessageWidget : BasicWidget
    {
    }
    class MessageWidgetMetaData : WidgetMetaData<MessageWidget>
    {

    }
}