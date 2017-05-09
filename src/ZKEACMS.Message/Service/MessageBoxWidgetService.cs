using System;
using Easy;
using Easy.Constant;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ZKEACMS.Message.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Service
{
    public class MessageBoxWidgetService : SimpleWidgetService<MessageBoxWidget>
    {
        private readonly IMessageService _messageService;
        public MessageBoxWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, IMessageService messageService)
            : base(widgetBasePartService, applicationContext)
        {
            _messageService = messageService;
        }

        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            return widget.ToWidgetViewModelPart(_messageService.Get(m => m.Status == (int)RecordStatus.Active));

        }
    }
}