/*!
 * http://www.zkea.net/
 * Copyright 2018 ZKEASOFT
 * http://www.zkea.net/licenses
 */

using Easy;
using Microsoft.AspNetCore.Mvc;
using ZKEACMS.Message.Models;
using ZKEACMS.Widget;

namespace ZKEACMS.Message.Service
{
    public class MessageWidgetService : SimpleWidgetService<MessageWidget>
    {
        public MessageWidgetService(IWidgetBasePartService widgetBasePartService, IApplicationContext applicationContext, CMSDbContext dbContext)
            : base(widgetBasePartService, applicationContext, dbContext)
        {
        }
        public override WidgetViewModelPart Display(WidgetBase widget, ActionContext actionContext)
        {
            return widget.ToWidgetViewModelPart(new MessageEntity());
        }
    }
}