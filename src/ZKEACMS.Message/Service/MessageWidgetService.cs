using Easy;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Message.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Service
{
    public class MessageWidgetService : SimpleWidgetService<MessageWidget>
    {
        public MessageWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext) 
            : base(widgetBasePartService, applicationContext)
        {
        }
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            return widget.ToWidgetViewModelPart(new MessageEntity());
        }
    }
}